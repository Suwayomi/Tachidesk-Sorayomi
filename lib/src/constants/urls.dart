enum AppUrls {
  sorayomiGithubUrl(url: "https://github.com/Suwayomi/Tachidesk-Sorayomi"),
  sorayomiLatestReleaseUrl(
      url: "https://github.com/Suwayomi/Tachidesk-Sorayomi/releases/latest"),
  tachideskHelp(url: "https://github.com/Suwayomi/Tachidesk-Server/wiki"),
  tachideskReddit(url: "https://www.reddit.com/r/Tachidesk"),
  sorayomiWhatsNew(
      url: "https://github.com/Suwayomi/Tachidesk-Sorayomi/releases/tag/"),
  sorayomiLatestReleaseApiUrl(
    url:
        "https://api.github.com/repos/Suwayomi/Tachidesk-Sorayomi/releases/latest",
  );

  const AppUrls({required this.url});

  final String url;
}
