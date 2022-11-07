import 'model/admin/admin_homepage_model/admin_homepage_model.dart';
import 'model/home_page/home_page_model.dart';

List<TableInfo> userList = [
  TableInfo(fullName: 'Rais Saleh', username: 'tester', email: 'tester@test.com', membership: 'premium', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Tam Til', username: 'tester1', email: 'tester@test.com', membership: 'free', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Sam Will', username: 'tester2', email: 'tester@test.com', membership: 'premium', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Fairuz Azim', username: 'tester3', email: 'tester@test.com', membership: 'premium', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Amir Zamri', username: 'tester4', email: 'tester@test.com', membership: 'free', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'James Hariharan', username: 'tester5', email: 'tester@test.com', membership: 'free', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Yong Yew Seong', username: 'tester6', email: 'tester@test.com', membership: 'premium', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Ramesh Subramaniam', username: 'tester7', email: 'tester@test.com', membership: 'premium', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Lim Ai Lu', username: 'tester8', email: 'tester@test.com', membership: 'premium', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Hasnah Md Aris', username: 'tester9', email: 'tester@test.com', membership: 'free', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Hairil Azril', username: 'tester10', email: 'tester@test.com', membership: 'premium', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Rais Saleh', username: 'tester', email: 'tester@test.com', membership: 'premium', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Tam Til', username: 'tester1', email: 'tester@test.com', membership: 'free', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Sam Will', username: 'tester2', email: 'tester@test.com', membership: 'premium', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Fairuz Azim', username: 'tester3', email: 'tester@test.com', membership: 'premium', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Amir Zamri', username: 'tester4', email: 'tester@test.com', membership: 'free', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'James Hariharan', username: 'tester5', email: 'tester@test.com', membership: 'free', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Yong Yew Seong', username: 'tester6', email: 'tester@test.com', membership: 'premium', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Ramesh Subramaniam', username: 'tester7', email: 'tester@test.com', membership: 'premium', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Lim Ai Lu', username: 'tester8', email: 'tester@test.com', membership: 'premium', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Hasnah Md Aris', username: 'tester9', email: 'tester@test.com', membership: 'free', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Hairil Azril', username: 'tester10', email: 'tester@test.com', membership: 'premium', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Rais Saleh', username: 'tester', email: 'tester@test.com', membership: 'premium', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Tam Til', username: 'tester1', email: 'tester@test.com', membership: 'free', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Sam Will', username: 'tester2', email: 'tester@test.com', membership: 'premium', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Fairuz Azim', username: 'tester3', email: 'tester@test.com', membership: 'premium', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Amir Zamri', username: 'tester4', email: 'tester@test.com', membership: 'free', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'James Hariharan', username: 'tester5', email: 'tester@test.com', membership: 'free', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Yong Yew Seong', username: 'tester6', email: 'tester@test.com', membership: 'premium', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Ramesh Subramaniam', username: 'tester7', email: 'tester@test.com', membership: 'premium', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Lim Ai Lu', username: 'tester8', email: 'tester@test.com', membership: 'premium', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Hasnah Md Aris', username: 'tester9', email: 'tester@test.com', membership: 'free', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
  TableInfo(fullName: 'Hairil Azril', username: 'tester10', email: 'tester@test.com', membership: 'premium', dateRegistered: '2022-05-01', expiryDate: '2023-01-01'),
];

List<Songs> rockSongs = [
  Songs(image: 'items/rock/intheend-rock.jpeg', title: 'In the End', quality: 'MV', artist: 'Linkin Park'),
  Songs(image: 'items/rock/likeastone-rock.jpeg', title: 'Like A Stone', quality: 'HD', artist: 'Audioslave'),
  Songs(image: 'items/rock/numb-rock.jpeg', title: 'Numb', quality: 'MV', artist: 'Linkin Park'),
  Songs(image: 'items/rock/unholyconfessions-rock.jpeg', title: 'Unholy Confessions', quality: 'MV', artist: 'Avenged Sevenfold'),
  Songs(image: 'items/rock/lonelyday-rock.jpeg', title: 'Lonely Day', quality: 'HD', artist: 'System Of A Down'),
];

List<Songs> balladSongs = [
  Songs(image: 'items/ballad/kauyangsatu-ballad.jpeg', title: 'Kau Yang Satu', quality: 'MV', artist: 'WOW'),
  Songs(image: 'items/ballad/kembaliterjalin-slam.jpeg', title: 'Kembali Terjalin', quality: 'HD', artist: 'Slam'),
  Songs(image: 'items/ballad/sepertidulu-ballad.jpeg', title: 'Seperti Dulu', quality: 'HD', artist: 'Exists'),
  Songs(image: 'items/ballad/tiara-ballad.jpeg', title: 'Tiara', quality: 'MV', artist: 'Kris'),
];

List<Songs> popSongs = [
  Songs(image: 'items/pop/adoreyou-pop.jpeg', title: 'Adore You', quality: 'MV', artist: 'Harry Styles'),
  Songs(image: 'items/pop/gunjou-pop.jpeg', title: 'Gunjou', quality: 'HD', artist: 'Yoasobi'),
  Songs(image: 'items/pop/ifeeitcoming-pop.jpeg', title: 'I Feel it Coming', quality: 'HD', artist: 'The Weeknd'),
  Songs(image: 'items/pop/stay-pop.jpeg', title: 'Stay', quality: 'MV', artist: 'Justin Bieber'),
  Songs(image: 'items/pop/takemybreath-pop.jpeg', title: 'Take My Breath', quality: 'HD', artist: 'The Weekend'),
  Songs(image: 'items/pop/yorunikakeru-pop.jpeg', title: 'Yoru ni Kakeru', quality: 'HD', artist: 'Yoasobi'),
];

List<Songs> jazzSongs = [
  Songs(image: 'items/jazz/inthemood-jazz.jpeg', title: 'In The Mood', quality: 'HD', artist: 'Glenn Miller'),
  Songs(image: 'items/jazz/thatwhatilike-jazz.jpeg', title: "That's What I Like", quality: 'MV', artist: 'Bruno Mars'),
  Songs(image: 'items/jazz/thewayyoulooktonight-jazz.jpeg', title: 'The Way You Look Tonight', quality: 'HD', artist: 'Frank Sinatra'),
];