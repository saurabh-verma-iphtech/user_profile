import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_profile/model/user.dart';

final userProvider = StateNotifierProvider<UserNotifier, List<User>>(
  (ref) => UserNotifier(),
);

class UserNotifier extends StateNotifier<List<User>> {
  UserNotifier()
    : super([
        // User(
        //   id: "1",
        //   name: 'Saurabh',
        //   age: '24',
        //   email: 'saurabh@gmail.com',
        //   bio: 'Software Engineer at IPH',
        //   phoneNo: '234897328957',
        //   profilePic:
        //       'https://t4.ftcdn.net/jpg/03/25/73/59/360_F_325735908_TkxHU7okor9CTWHBhkGfdRumONWfIDEb.jpg',
        //   jobProfile: 'Flutter Developer',
        //   address: "Lucknow"
        // ),
        // User(
        //   id: "2",
        //   name: 'Jack',
        //   age: '34',
        //   email: 'jack@gmail.com',
        //   phoneNo: '234897328957',
        //   bio: 'Software Engineer at IPH',
        //   jobProfile: 'iOS Developer',
        //   address: "Lucknow",
        //   profilePic:
        //       'https://img.freepik.com/premium-photo/confident-businessman-portrait_220507-11527.jpg?semt=ais_hybrid',
        // ),
        // User(
        //   id: "3",
        //   name: 'Rammy',
        //   age: '36',
        //   email: 'saurabh@gmail.com',
        //   phoneNo: '2348973257',
        //   bio: 'Software Engineer at IPH',
        //   jobProfile: 'Web Developer',
        //   profilePic:
        //       'https://thumbs.dreamstime.com/b/warm-friendly-beautiful-cheerful-african-american-executive-business-woman-isolated-white-background-beautiful-female-african-167982803.jpg',
        //       address: "Lucknow"
        // ),
        // User(
        //   id: "4",
        //   name: 'Joseph',
        //   age: '28',
        //   email: 'saurabh@gmail.com',
        //   phoneNo: '234897328957',
        //   bio: 'Software Engineer at IPH',
        //   jobProfile: 'Android Developer',
        //   profilePic:
        //       'https://t3.ftcdn.net/jpg/02/83/12/98/360_F_283129831_MTTjxBv6zrcSREEsmLgvLQJFU0HyW2ui.jpg',
        //       address: "Canbra"
        // ),
        // User(
        //   id: "5",
        //   name: 'Morris',
        //   age: '32',
        //   email: 'morris@gmail.com',
        //   phoneNo: '234897328957',
        //   bio: 'Software Engineer at IPH',
        //   jobProfile: 'PHP Developer',
        //   profilePic:
        //       'https://img.freepik.com/free-photo/smiling-young-male-professional-standing-with-arms-crossed-while-making-eye-contact-against-isolated-background_662251-838.jpg',
        //       address: "Spain"
        // ),
        // User(
        //   id: "6",
        //   name: 'Anglina',
        //   age: '29',
        //   email: 'anglina@gmail.com',
        //   bio: 'Software Engineer at IPH',
        //   phoneNo: '234897328957',
        //   jobProfile: 'Flutter Developer',
        //   profilePic:
        //       'https://thumbs.dreamstime.com/b/office-business-woman-planning-notebook-investment-information-reminder-career-portrait-female-person-office-353898554.jpg',
        //       address: "London"
        // ),
      ]);

  User? selectedUser;
  void selectUser(User user) {
    selectedUser = user;
  }

  void addUser(User newUser) {
    state = [...state, newUser];
  }

  void deleteUser(String userId) {
    state = state.where((user) => user.id != userId).toList();
  }
}
