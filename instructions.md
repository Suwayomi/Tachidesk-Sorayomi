Migration Feature Implementation Plan for Sorayomi (Single Manga Migration)
Feature Summary
Goal: Add migration functionality to individual manga detail screens, allowing users to migrate a single manga from one source to another while preserving reading progress, categories, and optionally downloaded chapters.
User Flow:

User opens manga details screen
Taps 3-dot menu in top right
Selects "Migrate" option
Chooses target source
Searches/selects target manga in new source
Configures migration options
Executes migration with progress tracking

Entry Point: Only from manga detail screen → 3-dot menu → Migrate option

Phase 1: Foundation & Research
Task 1.1: API Endpoint Discovery
Objective: Understand Suwayomi-Server's migration API
Subtasks:

Use WebUI to perform test migration while monitoring network tab
Document migration API endpoints and formats:

GET /api/v1/manga/{mangaId}/sources/migrate
POST /api/v1/manga/{mangaId}/migrate  
GET /api/v1/source/{sourceId}/search?query={title}

Test authentication requirements and headers
Document error response formats and status codes
Test rate limiting behavior for search queries

Task 1.2: Study Manga Details Screen Structure
Objective: Understand how to integrate with existing manga screen
Files to examine:
dartlib/src/features/manga_book/presentation/manga_details/manga_details_screen.dart
lib/src/features/manga_book/presentation/manga_details/controller/manga_details_controller.dart
Subtasks:

Study existing 3-dot menu implementation
Analyze manga details controller structure
Review navigation patterns from manga screen
Study existing manga data models
Document popup menu item patterns


Phase 2: Data Layer Implementation
Task 2.1: Create Migration Models
File: lib/src/domain/models/migration_models.dart
Subtasks:

Create MigrationSource model

dartclass MigrationSource {
  final String id;
  final String name;
  final String lang;
  final bool isConfigured;
  final int mangaCount;
}

Create MigrationOption model

dartclass MigrationOption {
  final bool migrateChapters;
  final bool migrateCategories; 
  final bool migrateDownloads;
  final bool migrateTracking;
}

Create MigrationResult model

dartclass MigrationResult {
  final bool success;
  final String? error;
  final int migratedChapters;
  final List<String> warnings;
  final MangaDto? newManga;
}

Create MigrationProgress model

dartclass MigrationProgress {
  final String currentStep;
  final double percentage;
  final MigrationStatus status;
}

Add JSON serialization for all models
Write unit tests for model conversion

Task 2.2: Implement Migration API Client
File: lib/src/data/remote/migration_api.dart
Subtasks:

Create migration API client following existing patterns

dartclass MigrationApiClient {
  final Dio dio;
  
  Future<List<MigrationSource>> getMigrationSources(int mangaId);
  Future<List<MangaDto>> searchMangaInSource(String sourceId, String query);
  Future<MigrationResult> migrateManga(int fromMangaId, int toMangaId, MigrationOption options);
}

Follow existing Dio client patterns in codebase
Add proper error handling and timeouts
Add request/response logging for debugging
Implement retry logic for failed API calls
Write integration tests with mock responses

Task 2.3: Create Migration Repository
File: lib/src/features/migration/data/migration_repository.dart
Subtasks:

Create repository interface

dartabstract class MigrationRepository {
  Future<Either<Failure, List<MigrationSource>>> getMigrationSources(int mangaId);
  Future<Either<Failure, List<MangaDto>>> searchMangaInSource(String sourceId, String query);
  Future<Either<Failure, MigrationResult>> migrateManga(int fromMangaId, int toMangaId, MigrationOption options);
}

Implement repository using API client
Add caching for migration sources
Follow existing error handling patterns
Add proper exception mapping
Write repository tests with mocked dependencies


Phase 3: State Management
Task 3.1: Create Migration Controller
File: lib/src/features/migration/controller/migration_controller.dart
Subtasks:

Set up GetX controller following existing patterns

dartclass MigrationController extends GetxController {
  final MigrationRepository _repository;
  
  final Rx<List<MigrationSource>> availableSources = <MigrationSource>[].obs;
  final Rx<List<MangaDto>> searchResults = <MangaDto>[].obs;
  final Rx<MigrationProgress?> currentMigration = Rxn<MigrationProgress>();
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;
}

Implement source fetching logic

dartFuture<void> loadMigrationSources(int mangaId);

Create manga search functionality

dartFuture<void> searchInSource(String sourceId, String query);

Add migration execution with progress tracking

dartFuture<void> executeMigration(int fromMangaId, int toMangaId, MigrationOption options);

Implement migration cancellation
Add proper error handling and user feedback
Write comprehensive controller unit tests

Task 3.2: Update Manga Details Controller
File: lib/src/features/manga_book/presentation/manga_details/controller/manga_details_controller.dart
Subtasks:

Add migration entry point method (don't modify existing functionality)

dartvoid startMigration() {
  // Navigate to migration flow with current manga
}

Add migration completion handler

dartvoid onMigrationComplete(MigrationResult result) {
  // Refresh manga details if migration successful
  // Show success/failure message
}

Ensure no breaking changes to existing controller
Add unit tests for new migration methods


Phase 4: Manga Details Screen Integration
Task 4.1: Add Migrate Option to Popup Menu
File: lib/src/features/manga_book/presentation/manga_details/manga_details_screen.dart
Subtasks:

Study existing popup menu implementation
Add "Migrate" option to 3-dot menu

dart// Add to existing PopupMenuButton items
PopupMenuItem<String>(
  value: 'migrate',
  child: Row(
    children: [
      Icon(Icons.swap_horiz),
      SizedBox(width: 8),
      Text(context.l10n!.migrate),
    ],
  ),
),

Add migrate icon following app icon patterns
Handle menu item selection

dartcase 'migrate':
  _startMigration();
  break;

Connect to migration controller
Add proper spacing and styling consistent with other menu items
Test menu behavior on different screen sizes

Task 4.2: Add Migration Entry Point Logic
File: Same as above
Subtasks:

Create migration start method

dartvoid _startMigration() {
  Get.toNamed('/migration/source-selection', arguments: {
    'manga': controller.manga.value,
    'mangaId': widget.mangaId,
  });
}

Add navigation to migration flow
Pass current manga data to migration screens
Handle migration completion callback
Add proper error handling for migration entry
Update manga details after successful migration


Phase 5: Migration Flow Screens
Task 5.1: Create Source Selection Screen
File: lib/src/features/migration/presentation/source_selection_screen.dart
Subtasks:

Create source selection screen layout

dartclass SourceSelectionScreen extends StatelessWidget {
  final MangaDto sourceManga;
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n!.selectTargetSource),
      ),
      body: GetX<MigrationController>(
        builder: (controller) => _buildSourceList(controller.availableSources.value),
      ),
    );
  }
}

Display available sources in list format
Show source information (name, language, manga count)
Add source status indicators (working/broken)
Implement source filtering by language
Add loading states for source fetching
Handle error states for unavailable sources
Add source selection navigation to search screen

Task 5.2: Create Manga Search Screen
File: lib/src/features/migration/presentation/manga_search_screen.dart
Subtasks:

Create search interface

dartclass MangaSearchScreen extends StatelessWidget {
  final MangaDto sourceManga;
  final MigrationSource targetSource;
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search in ${targetSource.name}')),
      body: Column(children: [
        SearchBar(onChanged: _onSearchChanged),
        Expanded(child: _buildSearchResults()),
      ]),
    );
  }
}

Auto-search using original manga title on screen load
Display search results in grid format (follow existing manga grid patterns)
Show manga comparison cards (source vs target)
Add manual search capability
Handle no results state with helpful messaging
Add search result selection navigation to preview
Show loading states during search

Task 5.3: Create Migration Preview Screen
File: lib/src/features/migration/presentation/migration_preview_screen.dart
Subtasks:

Show source and target manga comparison

dartclass MigrationPreviewScreen extends StatelessWidget {
  final MangaDto sourceManga;
  final MangaDto targetManga;
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n!.migrationPreview)),
      body: Column(children: [
        MangaComparisonWidget(source: sourceManga, target: targetManga),
        MigrationOptionsWidget(onChanged: _onOptionsChanged),
        _buildActionButtons(),
      ]),
    );
  }
}

Display migration options with checkboxes
Show chapter count comparison
Add migration options configuration
Create confirmation dialog with warnings
Show potential data loss warnings
Add final migration execution button
Navigate to progress screen on confirmation

Task 5.4: Create Migration Progress Screen
File: lib/src/features/migration/presentation/migration_progress_screen.dart
Subtasks:

Display migration progress

dartclass MigrationProgressScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _confirmCancellation(),
      child: Scaffold(
        appBar: AppBar(title: Text(context.l10n!.migrationInProgress)),
        body: GetX<MigrationController>(
          builder: (controller) => _buildProgressContent(controller.currentMigration.value),
        ),
      ),
    );
  }
}

Show overall progress bar with percentage
Display current step information
Add cancellation functionality with confirmation
Show detailed progress messages
Display error messages with retry options
Create completion screen with success/failure summary
Navigate back to manga details on completion
Handle migration cancellation properly


Phase 6: Reusable Widgets
Task 6.1: Create Migration Options Widget
File: lib/src/features/migration/presentation/widgets/migration_options_widget.dart
Subtasks:

Create options configuration widget

dartclass MigrationOptionsWidget extends StatelessWidget {
  final MigrationOption options;
  final ValueChanged<MigrationOption> onChanged;
  
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        CheckboxListTile(
          title: Text(context.l10n!.migrateChapters),
          subtitle: Text(context.l10n!.migrateChaptersDescription),
          value: options.migrateChapters,
          onChanged: (value) => _updateOption('chapters', value),
        ),
        // More options...
      ]),
    );
  }
}

Add checkboxes for: chapters, categories, downloads, tracking
Add helpful descriptions for each option
Implement expand/collapse for advanced options
Save user preferences for future migrations
Add validation for option combinations
Create quick preset buttons (Quick, Full, Custom)

Task 6.2: Create Manga Comparison Widget
File: lib/src/features/migration/presentation/widgets/manga_comparison_widget.dart
Subtasks:

Display side-by-side manga comparison

dartclass MangaComparisonWidget extends StatelessWidget {
  final MangaDto sourceManga;
  final MangaDto targetManga;
  
  Widget build(BuildContext context) {
    return Card(
      child: Row(children: [
        Expanded(child: _buildMangaInfo(sourceManga, 'From')),
        Icon(Icons.arrow_forward),
        Expanded(child: _buildMangaInfo(targetManga, 'To')),
      ]),
    );
  }
}

Show cover images with labels
Compare titles, authors, descriptions
Highlight differences in metadata
Show chapter count comparison
Add confidence score indicator
Create expandable details view
Follow existing manga display patterns

Task 6.3: Create Source Card Widget
File: lib/src/features/migration/presentation/widgets/source_card_widget.dart
Subtasks:

Create source display card

dartclass SourceCard extends StatelessWidget {
  final MigrationSource source;
  final VoidCallback onTap;
  
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.source),
        title: Text(source.name),
        subtitle: Text('${source.lang} • ${source.mangaCount} manga'),
        trailing: _buildStatusIndicator(),
        onTap: onTap,
      ),
    );
  }
}

Show source name and language
Display manga count and status
Add status indicators (working/broken)
Implement proper card styling
Add loading states for source cards
Follow existing card design patterns


Phase 7: Navigation & Routes
Task 7.1: Add Migration Routes
File: lib/src/routes/router_config.dart (or equivalent)
Subtasks:

Study existing route structure
Add migration routes

dart// Add migration routes
GoRoute(
  path: '/migration/source-selection',
  name: 'migration-source-selection',
  builder: (context, state) => SourceSelectionScreen(
    manga: state.extra as MangaDto,
  ),
),
GoRoute(
  path: '/migration/search',
  name: 'migration-search', 
  builder: (context, state) => MangaSearchScreen(
    sourceManga: state.extra['sourceManga'],
    targetSource: state.extra['targetSource'],
  ),
),
// More routes...

Add proper route parameters for data passing
Configure route transitions
Test navigation flow between screens
Ensure proper back button behavior
Handle route parameter validation

Task 7.2: Add Migration Navigation Logic
File: Various migration screens
Subtasks:

Implement navigation between migration screens

dart// From source selection to search
Get.toNamed('/migration/search', arguments: {
  'sourceManga': sourceManga,
  'targetSource': selectedSource,
});

Add proper data passing between screens
Handle navigation back to manga details after completion
Add navigation guards for incomplete data
Test navigation edge cases
Ensure consistent navigation patterns


Phase 8: Localization
Task 8.1: Add English Localization
File: lib/src/l10n/app_en.arb
Subtasks:

Add migration menu and screen titles

json{
  "migrate": "Migrate",
  "selectTargetSource": "Select Target Source",
  "migrationPreview": "Migration Preview",
  "migrationInProgress": "Migration in Progress"
}

Add migration options and descriptions

json{
  "migrateChapters": "Migrate Chapters",
  "migrateChaptersDescription": "Copy chapter read status to new source",
  "migrateCategories": "Migrate Categories",
  "migrateDownloads": "Migrate Downloads"
}

Add error messages and confirmations

json{
  "migrationFailed": "Migration failed",
  "migrationCancelled": "Migration cancelled",
  "migrationComplete": "Migration completed successfully"
}

Add progress messages and status text
Add warning and confirmation dialog text
Add accessibility labels
Review all strings for clarity and consistency


Phase 9: Testing & Quality
Task 9.1: Unit Tests
Files: test/features/migration/
Subtasks:

Test migration models

darttestWidgets('MigrationOption should serialize correctly', (tester) async {
  final option = MigrationOption(migrateChapters: true, migrateCategories: false);
  final json = option.toJson();
  expect(json['migrateChapters'], isTrue);
});

Test migration controller logic
Test API client methods with mocked responses
Test repository error handling
Test navigation logic
Achieve 90%+ code coverage
Test edge cases and error scenarios

Task 9.2: Widget Tests
Files: test/features/migration/widgets/
Subtasks:

Test migration screen widget rendering
Test user interactions and form inputs
Test navigation between screens
Test responsive layout behavior
Test accessibility features
Test loading and error states
Test popup menu integration

Task 9.3: Integration Tests
Files: integration_test/migration/
Subtasks:

Test complete migration flow end-to-end
Test migration from manga details popup menu
Test migration cancellation scenarios
Test error recovery and retry
Test various migration option combinations
Test network failure scenarios
Test across different screen sizes


Phase 10: Polish & Documentation
Task 10.1: Performance Optimization
Objective: Ensure smooth user experience
Subtasks:

Optimize source loading and caching
Implement proper image loading for manga covers
Add search debouncing to prevent excessive API calls
Optimize UI rebuilds during progress updates
Add proper memory management
Test performance with slow network connections

Task 10.2: Error Handling & User Experience
Objective: Graceful failure handling
Subtasks:

Add comprehensive error messages for all scenarios
Implement retry mechanisms with user feedback
Add network connectivity handling
Create user-friendly error recovery flows
Add migration validation before execution
Test all error scenarios thoroughly

Task 10.3: Documentation
File: log.md
Subtasks:

Document migration feature usage
Create developer documentation for API endpoints
Document migration limitations and considerations
Add troubleshooting guide
Create screenshots for user guide
Document testing procedures


Implementation Timeline

Phases 1-2: Research + Data Layer
Phase 3: State Management

Phase 4: Manga Details Integration
Phase 5: Migration Flow Screens

Phase 6: Widgets
Phase 7: Navigation
Phase 8: Localization

Phase 9: Testing
Phase 10: Documentation + Polish


Getting Started Commands
bash# Create directory structure
mkdir -p lib/src/features/migration/{controller,data,presentation}
mkdir -p lib/src/features/migration/presentation/{screens,widgets}
mkdir -p test/features/migration

# Create initial files
touch lib/src/domain/models/migration_models.dart
touch lib/src/features/migration/controller/migration_controller.dart
touch lib/src/features/migration/data/migration_repository.dart

# Start with manga details screen examination
echo "Ready to implement manga migration feature!"
This focused implementation plan provides a clear path to add migration functionality through the manga details popup menu, following Sorayomi's existing patterns while avoiding complex Browse screen modifications!