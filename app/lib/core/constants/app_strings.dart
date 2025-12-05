/// Application text constants
class AppStrings {
  // Profile Screen
  static const String guest = 'Guest';
  static const String myListings = 'My Listings';
  static const String favorites = 'Favorites';
  static const String noListings = 'No listings yet';
  static const String startAddingItems =
      'Start adding items to sell, rent or trade';
  static const String noFavorites = 'No favorites yet';
  static const String startFavoritingItems = 'Start favoriting items you like';
  // Categories
  static const String games = 'Games';
  static const String consoles = 'Consoles';
  static const String accessories = 'Accessories';
  static const String electronics = 'Electronics';
  static const String all = 'All';
  static const String uncategorized = 'Uncategorized';
  static const String noDescription = 'No description provided.';
  // Register Screen
  static const String registerSubtitle = 'Join the Gaming Community';
  static const String phoneOptional = 'Phone number (optional)';
  static const String createAccount = 'Create Account';
  static const String alreadyHaveAccount = 'Already have an account? ';
  AppStrings._(); // Private constructor to prevent instantiation

  // App Name
  static const String appName = 'RePlay';
  static const String appTagline = 'Unlock Your Gaming Universe';

  // Authentication
  static const String login = 'Login';
  static const String signUp = 'Sign Up';
  static const String email = 'Email';
  static const String emailAddress = 'Email address';
  static const String password = 'Password';
  static const String currentPassword = 'Current Password';
  static const String newPassword = 'New Password';
  static const String confirmPassword = 'Confirm Password';

  // Navigation
  static const String home = 'Home';
  static const String add = 'Add';
  static const String profile = 'Profile';
  static const String marketplace = 'Marketplace';

  // Profile
  static const String editProfile = 'Edit Profile';
  static const String personalInformation = 'Personal Information';
  static const String username = 'Username';
  static const String phoneNumber = 'Phone Number';
  static const String security = 'Security';
  static const String changePhoto = 'Change Photo';
  static const String saveChanges = 'Save Changes';
  static const String dangerZone = 'Danger Zone';
  static const String deleteAccount = 'Delete Account';
  static const String deleteAccountWarning =
      'Deleting your account is a permanent action and cannot be undone.';
  static const String deleteAccountConfirm =
      'Are you sure you want to delete your account? This action cannot be undone.';
  static const String cancel = 'Cancel';
  static const String delete = 'Delete';

  // Listing
  static const String addListing = 'Add Listing';
  static const String uploadImage = 'Upload Image';
  static const String addPhoto = 'Add Photo';
  static const String itemDetails = 'Item Details';
  static const String title = 'Title';
  static const String description = 'Description';
  static const String listingType = 'Listing Type';
  static const String price = 'Price';
  static const String submitListing = 'Submit Listing';
  static const String rent = 'Rent';
  static const String trade = 'Trade';
  static const String sell = 'Sell';

  // Contact
  static const String contactSeller = 'Contact seller';
  static const String contactOptions = 'Contact Options';
  static const String messageSeller = 'Message Seller';
  static const String online = 'Online';
  static const String offline = 'Offline';

  // Validation Messages
  static const String requiredField = 'This field is required';
  static const String invalidEmail = 'Please enter a valid email address';
  static const String passwordTooShort =
      'Password must be at least 6 characters';
  static const String passwordsDoNotMatch = 'Passwords do not match';
  static const String invalidPrice = 'Please enter a valid price';
  static const String priceMustBePositive = 'Price must be greater than 0';
  static const String pleaseEnterTitle = 'Please enter a title';

  // Success Messages
  static const String changesSaved = 'Changes saved successfully!';
  static const String listingSubmitted = 'Listing submitted successfully!';
  static const String accountDeleted = 'Account deletion requested!';

  // Placeholders
  static const String titlePlaceholder = 'e.g., God of War Ragnarök (PS5)';
  static const String descriptionPlaceholder =
      'Describe your item, including condition, version, and any extras.';
  static const String pricePlaceholder = 'e.g. 500';
  static const String enterCurrentPassword = 'Enter current password';
  static const String enterNewPassword = 'Enter new password';

  // Error Messages
  static const String errorLoadingData = 'Failed to load data';
  static const String sellerNotFound = 'Seller not found';
  static const String tryAgain = 'Try Again';
  static const String phoneNotAvailable = 'Phone number not available';
  static const String emailNotAvailable = 'Email not available';
}
