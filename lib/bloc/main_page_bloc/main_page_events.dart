abstract class MainPageEvents {}

class LoadMovies extends MainPageEvents {
  final int page;

  LoadMovies(this.page);
}

class AddMorePageEvent extends MainPageEvents {
  final int page;

  AddMorePageEvent(this.page);
}
