import 'story.dart';

class StoryBrain {
  int _storyNumber = 0;

  final List<Story> _storyData = [
    Story(
      storyTitle: 'Bạn thấy một người lạ đang đến gần bạn vào ban đêm.',
      choice1: 'Chạy trốn.',
      choice2: 'Ở lại và hỏi chuyện.',
    ),
    Story(
      storyTitle:
      'Bạn chạy trốn và đến một khu rừng tối. Bạn thấy một căn nhà.',
      choice1: 'Vào nhà.',
      choice2: 'Tiếp tục chạy.',
    ),
    Story(
      storyTitle:
      'Người lạ hóa ra là một người hướng dẫn du lịch. Ông ta mời bạn tham gia một chuyến phiêu lưu.',
      choice1: 'Đi theo ông ta.',
      choice2: 'Từ chối và quay về.',
    ),
    Story(
      storyTitle: 'Bạn vào nhà và bị nhốt! Trò chơi kết thúc.',
      choice1: 'Chơi lại',
      choice2: '',
    ),
    Story(
      storyTitle: 'Bạn tiếp tục chạy và rơi xuống một cái hố. Trò chơi kết thúc.',
      choice1: 'Chơi lại',
      choice2: '',
    ),
    Story(
      storyTitle: 'Bạn quay về an toàn. Trò chơi kết thúc.',
      choice1: 'Chơi lại',
      choice2: '',
    ),
  ];

  void nextStory(int choiceNumber) {
    switch (_storyNumber) {
      case 0:
        _storyNumber = (choiceNumber == 1) ? 1 : 2;
        break;
      case 1:
        _storyNumber = (choiceNumber == 1) ? 3 : 4;
        break;
      case 2:
        _storyNumber = (choiceNumber == 1) ? 5 : 5;
        break;
      default:
        restart();
        break;
    }
  }

  String getStory() => _storyData[_storyNumber].storyTitle;

  String getChoice1() => _storyData[_storyNumber].choice1;

  String getChoice2() => _storyData[_storyNumber].choice2;

  bool buttonShouldBeVisible() {
    return _storyNumber < 3;
  }

  void restart() {
    _storyNumber = 0;
  }
}
