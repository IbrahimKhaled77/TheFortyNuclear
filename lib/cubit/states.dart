abstract class Home1State{}


class InitalState extends Home1State {}

class SuccessGetHadiState extends Home1State {}

class ErrorGetHadiState extends Home1State {
  final String error;

  ErrorGetHadiState(this.error);

}

class LoadingGetHadiState extends Home1State {}


class LikeSuccessState extends Home1State {}
class LikeErorrState extends Home1State {}


class OnPlayerCompleteSuccessStates extends Home1State{}

class OnPlayerCompleteErrorStates extends Home1State{}


class OnDurationChangedLoadingStates extends Home1State{}

class OnDurationChangedSuccessStates extends Home1State{}

class OnDurationChangedErorrStates extends Home1State{}


class OnPositionChangedSuccessStates extends Home1State{}


class OnPositionChangedErorrStates extends Home1State{}


class SeekPlaySuccessStates extends Home1State{}

class AddSuccessStates extends Home1State{}

class PlayAudioSuccessStates extends Home1State{}

class StopAudioSuccessStates extends Home1State{}
class StopEndSuccessStates extends Home1State{}
class MinusSuccessStates extends Home1State{}


class InitalPlaySuccessStates extends Home1State{}

class ChangeNavigationBarItemsSuccessStates extends Home1State{}

class ChangeNavigationBarItemsSuccessAudioStates extends Home1State{}

class ShareFloatingActionButtonSuccessStates extends Home1State{}