// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(FetchPolicy.serializer)
      ..add(GAboutData.serializer)
      ..add(GAboutData_aboutServer.serializer)
      ..add(GAboutFragmentData.serializer)
      ..add(GAboutFragmentReq.serializer)
      ..add(GAboutFragmentVars.serializer)
      ..add(GAboutReq.serializer)
      ..add(GAboutVars.serializer)
      ..add(GAllCategoriesData.serializer)
      ..add(GAllCategoriesData_categories.serializer)
      ..add(GAllCategoriesData_categories_nodes.serializer)
      ..add(GAllCategoriesData_categories_nodes_mangas.serializer)
      ..add(GAllCategoriesData_categories_nodes_meta.serializer)
      ..add(GAllCategoriesData_categories_pageInfo.serializer)
      ..add(GAllCategoriesReq.serializer)
      ..add(GAllCategoriesVars.serializer)
      ..add(GAutomaticBackupSettingsFragmentData.serializer)
      ..add(GAutomaticBackupSettingsFragmentReq.serializer)
      ..add(GAutomaticBackupSettingsFragmentVars.serializer)
      ..add(GBackupRestoreState.serializer)
      ..add(GBindTrackInput.serializer)
      ..add(GBooleanFilterInput.serializer)
      ..add(GBrowserSettingsFragmentData.serializer)
      ..add(GBrowserSettingsFragmentReq.serializer)
      ..add(GBrowserSettingsFragmentVars.serializer)
      ..add(GCategoryConditionInput.serializer)
      ..add(GCategoryFilterInput.serializer)
      ..add(GCategoryFragmentData.serializer)
      ..add(GCategoryFragmentData_mangas.serializer)
      ..add(GCategoryFragmentData_meta.serializer)
      ..add(GCategoryFragmentReq.serializer)
      ..add(GCategoryFragmentVars.serializer)
      ..add(GCategoryMetaTypeInput.serializer)
      ..add(GCategoryOrderBy.serializer)
      ..add(GChapterConditionInput.serializer)
      ..add(GChapterFilterInput.serializer)
      ..add(GChapterFragmentData.serializer)
      ..add(GChapterFragmentData_meta.serializer)
      ..add(GChapterFragmentReq.serializer)
      ..add(GChapterFragmentVars.serializer)
      ..add(GChapterMetaTypeInput.serializer)
      ..add(GChapterOrderBy.serializer)
      ..add(GClearCachedImagesInput.serializer)
      ..add(GClearDownloaderInput.serializer)
      ..add(GCloudFlareBypassFragmentData.serializer)
      ..add(GCloudFlareBypassFragmentReq.serializer)
      ..add(GCloudFlareBypassFragmentVars.serializer)
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
      ..add(GExtensionFragmentData.serializer)
      ..add(GExtensionFragmentReq.serializer)
      ..add(GExtensionFragmentVars.serializer)
      ..add(GExtensionOrderBy.serializer)
      ..add(GFetchChapterPagesInput.serializer)
      ..add(GFetchChaptersInput.serializer)
      ..add(GFetchExtensionsInput.serializer)
      ..add(GFetchMangaInput.serializer)
      ..add(GFetchSourceMangaInput.serializer)
      ..add(GFetchSourceMangaType.serializer)
      ..add(GFilterChangeInput.serializer)
      ..add(GFloatFilterInput.serializer)
      ..add(GFullSourceFragmentData.serializer)
      ..add(GFullSourceFragmentData_extension.serializer)
      ..add(GFullSourceFragmentData_filters__asCheckBoxFilter.serializer)
      ..add(GFullSourceFragmentData_filters__asGroupFilter.serializer)
      ..add(
          GFullSourceFragmentData_filters__asGroupFilter_filters__asCheckBoxFilter
              .serializer)
      ..add(
          GFullSourceFragmentData_filters__asGroupFilter_filters__asHeaderFilter
              .serializer)
      ..add(
          GFullSourceFragmentData_filters__asGroupFilter_filters__asSelectFilter
              .serializer)
      ..add(
          GFullSourceFragmentData_filters__asGroupFilter_filters__asSeparatorFilter
              .serializer)
      ..add(GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter
          .serializer)
      ..add(
          GFullSourceFragmentData_filters__asGroupFilter_filters__asSortFilter_SortFilterDefault
              .serializer)
      ..add(GFullSourceFragmentData_filters__asGroupFilter_filters__asTextFilter
          .serializer)
      ..add(
          GFullSourceFragmentData_filters__asGroupFilter_filters__asTriStateFilter
              .serializer)
      ..add(GFullSourceFragmentData_filters__asGroupFilter_filters__base
          .serializer)
      ..add(GFullSourceFragmentData_filters__asHeaderFilter.serializer)
      ..add(GFullSourceFragmentData_filters__asSelectFilter.serializer)
      ..add(GFullSourceFragmentData_filters__asSeparatorFilter.serializer)
      ..add(GFullSourceFragmentData_filters__asSortFilter.serializer)
      ..add(GFullSourceFragmentData_filters__asSortFilter_SortFilterDefault
          .serializer)
      ..add(GFullSourceFragmentData_filters__asTextFilter.serializer)
      ..add(GFullSourceFragmentData_filters__asTriStateFilter.serializer)
      ..add(GFullSourceFragmentData_filters__base.serializer)
      ..add(GFullSourceFragmentReq.serializer)
      ..add(GFullSourceFragmentVars.serializer)
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
      ..add(GMangaFragmentData.serializer)
      ..add(GMangaFragmentData_lastReadChapter.serializer)
      ..add(GMangaFragmentData_lastReadChapter_meta.serializer)
      ..add(GMangaFragmentData_latestFetchedChapter.serializer)
      ..add(GMangaFragmentData_latestFetchedChapter_meta.serializer)
      ..add(GMangaFragmentData_latestReadChapter.serializer)
      ..add(GMangaFragmentData_latestReadChapter_meta.serializer)
      ..add(GMangaFragmentData_latestUploadedChapter.serializer)
      ..add(GMangaFragmentData_latestUploadedChapter_meta.serializer)
      ..add(GMangaFragmentData_meta.serializer)
      ..add(GMangaFragmentData_source.serializer)
      ..add(GMangaFragmentData_source_extension.serializer)
      ..add(GMangaFragmentReq.serializer)
      ..add(GMangaFragmentVars.serializer)
      ..add(GMangaMetaTypeInput.serializer)
      ..add(GMangaOrderBy.serializer)
      ..add(GMangaStatus.serializer)
      ..add(GMangaStatusFilterInput.serializer)
      ..add(GMetaConditionInput.serializer)
      ..add(GMetaFilterInput.serializer)
      ..add(GMetaOrderBy.serializer)
      ..add(GMiscSettingsFragmentData.serializer)
      ..add(GMiscSettingsFragmentReq.serializer)
      ..add(GMiscSettingsFragmentVars.serializer)
      ..add(GPageInfoFragmentData.serializer)
      ..add(GPageInfoFragmentReq.serializer)
      ..add(GPageInfoFragmentVars.serializer)
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
      ..add(GRestoreStatusFragmentData.serializer)
      ..add(GRestoreStatusFragmentReq.serializer)
      ..add(GRestoreStatusFragmentVars.serializer)
      ..add(GRestoreStatusReq.serializer)
      ..add(GRestoreStatusVars.serializer)
      ..add(GSearchTrackerInput.serializer)
      ..add(GServerBindingFragmentData.serializer)
      ..add(GServerBindingFragmentReq.serializer)
      ..add(GServerBindingFragmentVars.serializer)
      ..add(GServerSettingsData.serializer)
      ..add(GServerSettingsData_settings.serializer)
      ..add(GServerSettingsReq.serializer)
      ..add(GServerSettingsVars.serializer)
      ..add(GServerUpdateData.serializer)
      ..add(GServerUpdateData_checkForServerUpdates.serializer)
      ..add(GServerUpdateFragmentData.serializer)
      ..add(GServerUpdateFragmentReq.serializer)
      ..add(GServerUpdateFragmentVars.serializer)
      ..add(GServerUpdateReq.serializer)
      ..add(GServerUpdateVars.serializer)
      ..add(GSetCategoryMetaInput.serializer)
      ..add(GSetChapterMetaInput.serializer)
      ..add(GSetGlobalMetaInput.serializer)
      ..add(GSetMangaMetaInput.serializer)
      ..add(GSetSettingsInput.serializer)
      ..add(GSetSourceMetaInput.serializer)
      ..add(GSettingsFragmentData.serializer)
      ..add(GSettingsFragmentReq.serializer)
      ..add(GSettingsFragmentVars.serializer)
      ..add(GSocksProxyFragmentData.serializer)
      ..add(GSocksProxyFragmentReq.serializer)
      ..add(GSocksProxyFragmentVars.serializer)
      ..add(GSortOrder.serializer)
      ..add(GSortSelectionInput.serializer)
      ..add(GSourceConditionInput.serializer)
      ..add(GSourceFilterInput.serializer)
      ..add(GSourceFragmentData.serializer)
      ..add(GSourceFragmentData_extension.serializer)
      ..add(GSourceFragmentReq.serializer)
      ..add(GSourceFragmentVars.serializer)
      ..add(GSourceMetaTypeInput.serializer)
      ..add(GSourceOrderBy.serializer)
      ..add(GSourcePreferenceChangeInput.serializer)
      ..add(GSourcePreferenceFragmentData__asCheckBoxPreference.serializer)
      ..add(GSourcePreferenceFragmentData__asEditTextPreference.serializer)
      ..add(GSourcePreferenceFragmentData__asListPreference.serializer)
      ..add(
          GSourcePreferenceFragmentData__asMultiSelectListPreference.serializer)
      ..add(GSourcePreferenceFragmentData__asSwitchPreference.serializer)
      ..add(GSourcePreferenceFragmentData__base.serializer)
      ..add(GSourcePreferenceFragmentReq.serializer)
      ..add(GSourcePreferenceFragmentVars.serializer)
      ..add(GStartDownloaderInput.serializer)
      ..add(GStopDownloaderInput.serializer)
      ..add(GStringFilterInput.serializer)
      ..add(GToggleDebugLogsData.serializer)
      ..add(GToggleDebugLogsData_setSettings.serializer)
      ..add(GToggleDebugLogsData_setSettings_settings.serializer)
      ..add(GToggleDebugLogsReq.serializer)
      ..add(GToggleDebugLogsVars.serializer)
      ..add(GToggleFlareSolverrData.serializer)
      ..add(GToggleFlareSolverrData_setSettings.serializer)
      ..add(GToggleFlareSolverrData_setSettings_settings.serializer)
      ..add(GToggleFlareSolverrReq.serializer)
      ..add(GToggleFlareSolverrVars.serializer)
      ..add(GToggleGqlDebugLogsData.serializer)
      ..add(GToggleGqlDebugLogsData_setSettings.serializer)
      ..add(GToggleGqlDebugLogsData_setSettings_settings.serializer)
      ..add(GToggleGqlDebugLogsReq.serializer)
      ..add(GToggleGqlDebugLogsVars.serializer)
      ..add(GToggleSocksProxyData.serializer)
      ..add(GToggleSocksProxyData_setSettings.serializer)
      ..add(GToggleSocksProxyData_setSettings_settings.serializer)
      ..add(GToggleSocksProxyReq.serializer)
      ..add(GToggleSocksProxyVars.serializer)
      ..add(GToggleSystemTrayEnabledData.serializer)
      ..add(GToggleSystemTrayEnabledData_setSettings.serializer)
      ..add(GToggleSystemTrayEnabledData_setSettings_settings.serializer)
      ..add(GToggleSystemTrayEnabledReq.serializer)
      ..add(GToggleSystemTrayEnabledVars.serializer)
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
      ..add(GUpdateExtensionReposData.serializer)
      ..add(GUpdateExtensionReposData_setSettings.serializer)
      ..add(GUpdateExtensionReposData_setSettings_settings.serializer)
      ..add(GUpdateExtensionReposReq.serializer)
      ..add(GUpdateExtensionReposVars.serializer)
      ..add(GUpdateExtensionsInput.serializer)
      ..add(GUpdateFlareSolverrSessionNameData.serializer)
      ..add(GUpdateFlareSolverrSessionNameData_setSettings.serializer)
      ..add(GUpdateFlareSolverrSessionNameData_setSettings_settings.serializer)
      ..add(GUpdateFlareSolverrSessionNameReq.serializer)
      ..add(GUpdateFlareSolverrSessionNameVars.serializer)
      ..add(GUpdateFlareSolverrSessionTtlData.serializer)
      ..add(GUpdateFlareSolverrSessionTtlData_setSettings.serializer)
      ..add(GUpdateFlareSolverrSessionTtlData_setSettings_settings.serializer)
      ..add(GUpdateFlareSolverrSessionTtlReq.serializer)
      ..add(GUpdateFlareSolverrSessionTtlVars.serializer)
      ..add(GUpdateFlareSolverrTimeoutData.serializer)
      ..add(GUpdateFlareSolverrTimeoutData_setSettings.serializer)
      ..add(GUpdateFlareSolverrTimeoutData_setSettings_settings.serializer)
      ..add(GUpdateFlareSolverrTimeoutReq.serializer)
      ..add(GUpdateFlareSolverrTimeoutVars.serializer)
      ..add(GUpdateFlareSolverrUrlData.serializer)
      ..add(GUpdateFlareSolverrUrlData_setSettings.serializer)
      ..add(GUpdateFlareSolverrUrlData_setSettings_settings.serializer)
      ..add(GUpdateFlareSolverrUrlReq.serializer)
      ..add(GUpdateFlareSolverrUrlVars.serializer)
      ..add(GUpdateLibraryMangaInput.serializer)
      ..add(GUpdateLocalSourcePathData.serializer)
      ..add(GUpdateLocalSourcePathData_setSettings.serializer)
      ..add(GUpdateLocalSourcePathData_setSettings_settings.serializer)
      ..add(GUpdateLocalSourcePathReq.serializer)
      ..add(GUpdateLocalSourcePathVars.serializer)
      ..add(GUpdateMangaCategoriesInput.serializer)
      ..add(GUpdateMangaCategoriesPatchInput.serializer)
      ..add(GUpdateMangaInput.serializer)
      ..add(GUpdateMangaPatchInput.serializer)
      ..add(GUpdateMangasCategoriesInput.serializer)
      ..add(GUpdateMangasInput.serializer)
      ..add(GUpdatePortData.serializer)
      ..add(GUpdatePortData_setSettings.serializer)
      ..add(GUpdatePortData_setSettings_settings.serializer)
      ..add(GUpdatePortReq.serializer)
      ..add(GUpdatePortVars.serializer)
      ..add(GUpdateServerIpData.serializer)
      ..add(GUpdateServerIpData_setSettings.serializer)
      ..add(GUpdateServerIpData_setSettings_settings.serializer)
      ..add(GUpdateServerIpReq.serializer)
      ..add(GUpdateServerIpVars.serializer)
      ..add(GUpdateSocksHostData.serializer)
      ..add(GUpdateSocksHostData_setSettings.serializer)
      ..add(GUpdateSocksHostData_setSettings_settings.serializer)
      ..add(GUpdateSocksHostReq.serializer)
      ..add(GUpdateSocksHostVars.serializer)
      ..add(GUpdateSocksPasswordData.serializer)
      ..add(GUpdateSocksPasswordData_setSettings.serializer)
      ..add(GUpdateSocksPasswordData_setSettings_settings.serializer)
      ..add(GUpdateSocksPasswordReq.serializer)
      ..add(GUpdateSocksPasswordVars.serializer)
      ..add(GUpdateSocksPortData.serializer)
      ..add(GUpdateSocksPortData_setSettings.serializer)
      ..add(GUpdateSocksPortData_setSettings_settings.serializer)
      ..add(GUpdateSocksPortReq.serializer)
      ..add(GUpdateSocksPortVars.serializer)
      ..add(GUpdateSocksUserNameData.serializer)
      ..add(GUpdateSocksUserNameData_setSettings.serializer)
      ..add(GUpdateSocksUserNameData_setSettings_settings.serializer)
      ..add(GUpdateSocksUserNameReq.serializer)
      ..add(GUpdateSocksUserNameVars.serializer)
      ..add(GUpdateSocksVersionData.serializer)
      ..add(GUpdateSocksVersionData_setSettings.serializer)
      ..add(GUpdateSocksVersionData_setSettings_settings.serializer)
      ..add(GUpdateSocksVersionReq.serializer)
      ..add(GUpdateSocksVersionVars.serializer)
      ..add(GUpdateSourceInParallelData.serializer)
      ..add(GUpdateSourceInParallelData_setSettings.serializer)
      ..add(GUpdateSourceInParallelData_setSettings_settings.serializer)
      ..add(GUpdateSourceInParallelReq.serializer)
      ..add(GUpdateSourceInParallelVars.serializer)
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
          const FullType(BuiltList,
              const [const FullType(GAllCategoriesData_categories_nodes)]),
          () => new ListBuilder<GAllCategoriesData_categories_nodes>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(GAllCategoriesData_categories_nodes_meta)]),
          () => new ListBuilder<GAllCategoriesData_categories_nodes_meta>())
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
              BuiltList, const [const FullType(GCategoryFragmentData_meta)]),
          () => new ListBuilder<GCategoryFragmentData_meta>())
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
              BuiltList, const [const FullType(GChapterFragmentData_meta)]),
          () => new ListBuilder<GChapterFragmentData_meta>())
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
          const FullType(BuiltList,
              const [const FullType(GFullSourceFragmentData_filters)]),
          () => new ListBuilder<GFullSourceFragmentData_filters>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(
                GFullSourceFragmentData_filters__asGroupFilter_filters)
          ]),
          () => new ListBuilder<
              GFullSourceFragmentData_filters__asGroupFilter_filters>())
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
          const FullType(BuiltList,
              const [const FullType(GMangaFragmentData_lastReadChapter_meta)]),
          () => new ListBuilder<GMangaFragmentData_lastReadChapter_meta>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(GMangaFragmentData_latestFetchedChapter_meta)
          ]),
          () => new ListBuilder<GMangaFragmentData_latestFetchedChapter_meta>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(GMangaFragmentData_latestReadChapter_meta)
          ]),
          () => new ListBuilder<GMangaFragmentData_latestReadChapter_meta>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(GMangaFragmentData_latestUploadedChapter_meta)
          ]),
          () =>
              new ListBuilder<GMangaFragmentData_latestUploadedChapter_meta>())
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
          const FullType(
              BuiltList, const [const FullType(GMangaFragmentData_meta)]),
          () => new ListBuilder<GMangaFragmentData_meta>())
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
