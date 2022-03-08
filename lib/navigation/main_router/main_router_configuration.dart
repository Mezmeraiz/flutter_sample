class MainRouterConfiguration {
  final int? currentMainTab;
  final int? noteId;
  final CurrentPage currentPage;

  MainRouterConfiguration.main(this.currentMainTab)
      : currentPage = CurrentPage.main,
        noteId = null;

  MainRouterConfiguration.noteInfo(this.noteId)
      : currentPage = CurrentPage.noteInfo,
        currentMainTab = 1;

  bool get isMainPage => currentPage == CurrentPage.main;

  bool get isNoteInfoPage => currentPage == CurrentPage.noteInfo;

}

enum CurrentPage { main, noteInfo }