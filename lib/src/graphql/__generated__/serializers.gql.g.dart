// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(FetchPolicy.serializer)
      ..add(GAboutData.serializer)
      ..add(GAboutData_aboutServer.serializer)
      ..add(GAboutReq.serializer)
      ..add(GAboutVars.serializer)
      ..add(GAutomaticBackupSettingsData.serializer)
      ..add(GAutomaticBackupSettingsData_settings.serializer)
      ..add(GAutomaticBackupSettingsReq.serializer)
      ..add(GAutomaticBackupSettingsVars.serializer)
      ..add(GBackupRestoreState.serializer)
      ..add(GBindTrackInput.serializer)
      ..add(GBooleanFilterInput.serializer)
      ..add(GCategoryConditionInput.serializer)
      ..add(GCategoryFilterInput.serializer)
      ..add(GCategoryMetaTypeInput.serializer)
      ..add(GCategoryOrderBy.serializer)
      ..add(GChapterConditionInput.serializer)
      ..add(GChapterFilterInput.serializer)
      ..add(GChapterMetaTypeInput.serializer)
      ..add(GChapterOrderBy.serializer)
      ..add(GClearCachedImagesInput.serializer)
      ..add(GClearDownloaderInput.serializer)
      ..add(GCreateBackupData.serializer)
      ..add(GCreateBackupData_createBackup.serializer)
      ..add(GCreateBackupInput.serializer)
      ..add(GCreateBackupReq.serializer)
      ..add(GCreateBackupVars.serializer)
      ..add(GCreateCategoryInput.serializer)
      ..add(GCursor.serializer)
      ..add(GDeleteCategoryInput.serializer)
      ..add(GDeleteCategoryMetaInput.serializer)
      ..add(GDeleteChapterMetaInput.serializer)
      ..add(GDeleteDownloadedChapterInput.serializer)
      ..add(GDeleteDownloadedChaptersInput.serializer)
      ..add(GDeleteGlobalMetaInput.serializer)
      ..add(GDeleteMangaMetaInput.serializer)
      ..add(GDeleteSourceMetaInput.serializer)
      ..add(GDequeueChapterDownloadInput.serializer)
      ..add(GDequeueChapterDownloadsInput.serializer)
      ..add(GDoubleFilterInput.serializer)
      ..add(GDownloadState.serializer)
      ..add(GDownloaderState.serializer)
      ..add(GEnqueueChapterDownloadInput.serializer)
      ..add(GEnqueueChapterDownloadsInput.serializer)
      ..add(GExtensionConditionInput.serializer)
      ..add(GExtensionFilterInput.serializer)
      ..add(GExtensionOrderBy.serializer)
      ..add(GFetchChapterPagesInput.serializer)
      ..add(GFetchChaptersInput.serializer)
      ..add(GFetchExtensionsInput.serializer)
      ..add(GFetchMangaInput.serializer)
      ..add(GFetchSourceMangaInput.serializer)
      ..add(GFetchSourceMangaType.serializer)
      ..add(GFilterChangeInput.serializer)
      ..add(GFloatFilterInput.serializer)
      ..add(GGlobalMetaTypeInput.serializer)
      ..add(GIncludeOrExclude.serializer)
      ..add(GInstallExternalExtensionInput.serializer)
      ..add(GIntFilterInput.serializer)
      ..add(GLoginTrackerCredentialsInput.serializer)
      ..add(GLoginTrackerOAuthInput.serializer)
      ..add(GLogoutTrackerInput.serializer)
      ..add(GLongFilterInput.serializer)
      ..add(GLongString.serializer)
      ..add(GMangaConditionInput.serializer)
      ..add(GMangaFilterInput.serializer)
      ..add(GMangaMetaTypeInput.serializer)
      ..add(GMangaOrderBy.serializer)
      ..add(GMangaStatus.serializer)
      ..add(GMangaStatusFilterInput.serializer)
      ..add(GMetaConditionInput.serializer)
      ..add(GMetaFilterInput.serializer)
      ..add(GMetaOrderBy.serializer)
      ..add(GPartialSettingsTypeInput.serializer)
      ..add(GReorderChapterDownloadInput.serializer)
      ..add(GResetSettingsInput.serializer)
      ..add(GRestoreBackupData.serializer)
      ..add(GRestoreBackupData_restoreBackup.serializer)
      ..add(GRestoreBackupData_restoreBackup_status.serializer)
      ..add(GRestoreBackupInput.serializer)
      ..add(GRestoreBackupReq.serializer)
      ..add(GRestoreBackupVars.serializer)
      ..add(GRestoreStatusData.serializer)
      ..add(GRestoreStatusData_restoreStatus.serializer)
      ..add(GRestoreStatusReq.serializer)
      ..add(GRestoreStatusVars.serializer)
      ..add(GSearchTrackerInput.serializer)
      ..add(GServerUpdateData.serializer)
      ..add(GServerUpdateData_checkForServerUpdates.serializer)
      ..add(GServerUpdateReq.serializer)
      ..add(GServerUpdateVars.serializer)
      ..add(GSetCategoryMetaInput.serializer)
      ..add(GSetChapterMetaInput.serializer)
      ..add(GSetGlobalMetaInput.serializer)
      ..add(GSetMangaMetaInput.serializer)
      ..add(GSetSettingsInput.serializer)
      ..add(GSetSourceMetaInput.serializer)
      ..add(GSortOrder.serializer)
      ..add(GSortSelectionInput.serializer)
      ..add(GSourceConditionInput.serializer)
      ..add(GSourceFilterInput.serializer)
      ..add(GSourceMetaTypeInput.serializer)
      ..add(GSourceOrderBy.serializer)
      ..add(GSourcePreferenceChangeInput.serializer)
      ..add(GStartDownloaderInput.serializer)
      ..add(GStopDownloaderInput.serializer)
      ..add(GStringFilterInput.serializer)
      ..add(GTrackRecordConditionInput.serializer)
      ..add(GTrackRecordFilterInput.serializer)
      ..add(GTrackRecordOrderBy.serializer)
      ..add(GTrackerConditionInput.serializer)
      ..add(GTrackerOrderBy.serializer)
      ..add(GTriState.serializer)
      ..add(GUpdateBackupIntervalData.serializer)
      ..add(GUpdateBackupIntervalData_setSettings.serializer)
      ..add(GUpdateBackupIntervalData_setSettings_settings.serializer)
      ..add(GUpdateBackupIntervalReq.serializer)
      ..add(GUpdateBackupIntervalVars.serializer)
      ..add(GUpdateBackupPathData.serializer)
      ..add(GUpdateBackupPathData_setSettings.serializer)
      ..add(GUpdateBackupPathData_setSettings_settings.serializer)
      ..add(GUpdateBackupPathReq.serializer)
      ..add(GUpdateBackupPathVars.serializer)
      ..add(GUpdateBackupTTLData.serializer)
      ..add(GUpdateBackupTTLData_setSettings.serializer)
      ..add(GUpdateBackupTTLData_setSettings_settings.serializer)
      ..add(GUpdateBackupTTLReq.serializer)
      ..add(GUpdateBackupTTLVars.serializer)
      ..add(GUpdateBackupTimeData.serializer)
      ..add(GUpdateBackupTimeData_setSettings.serializer)
      ..add(GUpdateBackupTimeData_setSettings_settings.serializer)
      ..add(GUpdateBackupTimeReq.serializer)
      ..add(GUpdateBackupTimeVars.serializer)
      ..add(GUpdateCategoriesInput.serializer)
      ..add(GUpdateCategoryInput.serializer)
      ..add(GUpdateCategoryMangaInput.serializer)
      ..add(GUpdateCategoryOrderInput.serializer)
      ..add(GUpdateCategoryPatchInput.serializer)
      ..add(GUpdateChapterInput.serializer)
      ..add(GUpdateChapterPatchInput.serializer)
      ..add(GUpdateChaptersInput.serializer)
      ..add(GUpdateExtensionInput.serializer)
      ..add(GUpdateExtensionPatchInput.serializer)
      ..add(GUpdateExtensionsInput.serializer)
      ..add(GUpdateLibraryMangaInput.serializer)
      ..add(GUpdateMangaCategoriesInput.serializer)
      ..add(GUpdateMangaCategoriesPatchInput.serializer)
      ..add(GUpdateMangaInput.serializer)
      ..add(GUpdateMangaPatchInput.serializer)
      ..add(GUpdateMangasCategoriesInput.serializer)
      ..add(GUpdateMangasInput.serializer)
      ..add(GUpdateSourcePreferenceInput.serializer)
      ..add(GUpdateState.serializer)
      ..add(GUpdateStopInput.serializer)
      ..add(GUpdateStrategy.serializer)
      ..add(GUpdateTrackInput.serializer)
      ..add(GValidateBackupData.serializer)
      ..add(GValidateBackupData_validateBackup.serializer)
      ..add(GValidateBackupData_validateBackup_missingSources.serializer)
      ..add(GValidateBackupInput.serializer)
      ..add(GValidateBackupReq.serializer)
      ..add(GValidateBackupVars.serializer)
      ..add(GWebUIChannel.serializer)
      ..add(GWebUIFlavor.serializer)
      ..add(GWebUIInterface.serializer)
      ..add(GWebUIUpdateInput.serializer)
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GCategoryFilterInput)]),
          () => new ListBuilder<GCategoryFilterInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GCategoryFilterInput)]),
          () => new ListBuilder<GCategoryFilterInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GChapterFilterInput)]),
          () => new ListBuilder<GChapterFilterInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GChapterFilterInput)]),
          () => new ListBuilder<GChapterFilterInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GExtensionFilterInput)]),
          () => new ListBuilder<GExtensionFilterInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GExtensionFilterInput)]),
          () => new ListBuilder<GExtensionFilterInput>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GFilterChangeInput)]),
          () => new ListBuilder<GFilterChangeInput>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GLongString)]),
          () => new ListBuilder<GLongString>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GLongString)]),
          () => new ListBuilder<GLongString>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GMangaFilterInput)]),
          () => new ListBuilder<GMangaFilterInput>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GMangaFilterInput)]),
          () => new ListBuilder<GMangaFilterInput>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GMangaStatus)]),
          () => new ListBuilder<GMangaStatus>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GMangaStatus)]),
          () => new ListBuilder<GMangaStatus>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GMetaFilterInput)]),
          () => new ListBuilder<GMetaFilterInput>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GMetaFilterInput)]),
          () => new ListBuilder<GMetaFilterInput>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GServerUpdateData_checkForServerUpdates)]),
          () => new ListBuilder<GServerUpdateData_checkForServerUpdates>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GSourceFilterInput)]),
          () => new ListBuilder<GSourceFilterInput>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GSourceFilterInput)]),
          () => new ListBuilder<GSourceFilterInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GTrackRecordFilterInput)]),
          () => new ListBuilder<GTrackRecordFilterInput>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(GTrackRecordFilterInput)]),
          () => new ListBuilder<GTrackRecordFilterInput>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(GValidateBackupData_validateBackup_missingSources)
          ]),
          () => new ListBuilder<
              GValidateBackupData_validateBackup_missingSources>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(bool)]),
          () => new ListBuilder<bool>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(bool)]),
          () => new ListBuilder<bool>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(double)]),
          () => new ListBuilder<double>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(double)]),
          () => new ListBuilder<double>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(double)]),
          () => new ListBuilder<double>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(double)]),
          () => new ListBuilder<double>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
