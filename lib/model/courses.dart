class ModuleData {
  final String title;
  final String subtitle;
  final String image;

  ModuleData({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}

class Course {
  String imgPath;
  String course;
  String length;
  List<ModuleData> modules;

  Course(this.imgPath, this.course, this.length, this.modules);

  static List<Course> generateCourse() {
    return [
      Course(
        'assets/images/physics.png',
        'Physics',
        '5 Modules',
        [
          ModuleData(
            title: 'Module 1',
            subtitle: 'Introduction to Physics',
            image: 'assets/images/module1.png',
          ),
          ModuleData(
            title: 'Module 2',
            subtitle: 'Newton\'s Laws of Motion',
            image: 'assets/images/module2.png',
          ),
          ModuleData(
            title: 'Module 3',
            subtitle: 'Electromagnetism',
            image: 'assets/images/module3.png',
          ),
          ModuleData(
            title: 'Module 4',
            subtitle: 'Optics and Light',
            image: 'assets/images/module4.png',
          ),
          ModuleData(
            title: 'Module 5',
            subtitle: 'Thermodynamics',
            image: 'assets/images/module5.png',
          ),
        ],
      ),
      Course(
        'assets/images/chemistry.png',
        'Chemistry',
        '3 Modules',
        [
          ModuleData(
            title: 'Module 1',
            subtitle: 'Introduction to Chemistry',
            image: 'assets/images/module1.png',
          ),
          ModuleData(
            title: 'Module 2',
            subtitle: 'Chemical Reactions',
            image: 'assets/images/module2.png',
          ),
          ModuleData(
            title: 'Module 3',
            subtitle: 'Chemical Bonding',
            image: 'assets/images/module3.png',
          ),
        ],
      ),
      Course(
        'assets/images/math.png',
        'Math',
        '8 Modules',
        [
          ModuleData(
            title: 'Module 1',
            subtitle: 'Algebra',
            image: 'assets/images/module1.png',
          ),
          ModuleData(
            title: 'Module 2',
            subtitle: 'Geometry',
            image: 'assets/images/module2.png',
          ),
          ModuleData(
            title: 'Module 3',
            subtitle: 'Trigonometry',
            image: 'assets/images/module3.png',
          ),
          ModuleData(
            title: 'Module 4',
            subtitle: 'Calculus',
            image: 'assets/images/module4.png',
          ),
          ModuleData(
            title: 'Module 5',
            subtitle: 'Statistics',
            image: 'assets/images/module5.png',
          ),
          ModuleData(
            title: 'Module 6',
            subtitle: 'Linear Algebra',
            image: 'assets/images/module6.png',
          ),
          ModuleData(
            title: 'Module 7',
            subtitle: 'Differential Equations',
            image: 'assets/images/module7.png',
          ),
          ModuleData(
            title: 'Module 8',
            subtitle: 'Probability',
            image: 'assets/images/module8.png',
          ),
        ],
      ),
    ];
  }
}
