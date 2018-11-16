class Constants{


  static const String appName = "Comodo";
  static const String registerScreenTitle = "Sign Up";
  static const String loginScreenTitle = "Sign In";



  /*******************************************
   *
   *  LOGIN SCREEN
   *
   * *****************************************/
  //static const String loginScreenTitle = "Login";
  static const String labelUsername = "Username";
  static const String labelPassword = "Password";
  static const String txtNewUser = "You don't have an account ?";
  static const String linkSignIn = "Sign In";
  static const String btnLogin = "Login";
  static const String hintPassword = "Type password here";

  //**************************************************************************
  //  SIGN UP SCREEN
  //**************************************************************************
  static const String labelFullName = "Full Name";
  static const String labelFirstName = "First Name";
  static const String labelLastName = "Last Name";
  static const String labelEmail = "Email";
  static const String labelPhoneNumber = "Phone Number";
  static const String labelPasswordConfirmation = "Confirm your Password";
  static const String labelBirthday = "Birthday";

  static const String hintFullName = "Type full name here";
  static const String hintEmail = "user@domainname";
  static const String hintFirstName = "First Name here";
  static const String hintLastName = "Last Name here";
  static const String hintUserName = "Choose a user name";
  static const String hintPhoneNumber = "+1(111)111-1111";
  static const String hintPasswordConfirmation = "Confirm your password";


  static const String txtAlreadyUser = "Already have an account ?";
  static const String txtCreateAccountTitle = "Create an account";
  static const String txtCreateAccountSubtitle = "A short description of why "
      "creating a profile consists in";
  static const String txtAddPhoto = "Add a profile picture";
  static const String txtWelcome = "Welcome, ";
  static const String txtUsername = "user.name2365";
  static const String txtEmailPlaceholder = "user.name@domain.xyz";
  static const String txtGladMessage = "We are glad to count you in the piins fa"
      "mily";

  static const String linkLogin = "Log In";



  static const String btnSignIn = "Sign In";
  static const String btnRegister = "Sign Up";
  static const String btnNext = "Next";
  static const String btnPrevious = "Previous";
  static const String btnSkip = "Skip";


  static const String errorMsgEmailFormat = "Wrong email format !";
  static const String errorEmptyField = "This field cannot be empty";
  static const String errorInputTooShort = "Not enough characters";

  static List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  static List<String> days = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '14',
    '15',
    '16',
    '17',
    '18',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31'
  ];


  /***********************************************************
   *  HOME SCREEN
   ***********************************************************/
  static final String menu_offers = "Offers";
  static final String menu_trips = "Trips";
  static final String menu_search = "Search";
  static final String menu_mailbox = "Messages";
  static final String menu_profile = "Profile";
  static final String menu_more = "More";

  ///***********************************************************
  /// Create a list of Years from 1900 to the current date year
  ///***********************************************************
  static List<String> generateYearsList(){
    var currentYear = new DateTime.now().year;
    List<String> years = new List();

    for(int i = 1900; i <= currentYear; i++)
      years.add(i.toString());

    return years;
  }


/************************************************************
 *  PROFILE SCREEN
 ************************************************************/
  static final String labelInscriptionDate = "Member since :";
  static final String labelSectionContact = "Contact";
  static final String labelSectionComments = "Comments";
  static final String labelSectionInfos = "General informations";

}