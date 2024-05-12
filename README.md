# Parking Spot Booking MVP for Macquarie University

This Minimum Viable Product (MVP) application provides a streamlined parking spot booking service for Macquarie University. It is designed to cater to students, staff, and visitors, allowing them to book, manage, and view their parking passes. The application requires users to sign in with their email and password or sign up as new users.

### Sign-In and Sign-Out Features:

1. **Sign-In**:  (For sign-in use -> Email: budhilc@gmail.com , Password: 123456)
   - New and existing users can sign in using their email and password on the sign-in screen.  
   - The application interacts with Google Firebase to validate user credentials.  
   - If credentials are valid, the user is redirected to the home page.  
   - Invalid credentials will prompt an error message, guiding users to re-enter their information or sign up if they are new.

2. **Sign-Up**:  
   - Users who do not have an account can sign up on the registration screen.  
   - Required details include a username, email, and password.  
   - Once registered, the new user account is created in the Firebase database, and users are redirected to the login page.

3. **Log Out**:  
   - The "Log Out" button on the home page allows users to securely sign out of the application.  
   - Once logged out, the user will be redirected to the sign-in screen.

### Home Page Features:

1. **Parking Pass**:  
   - After signing in, users can book a parking spot by selecting the "Parking Pass" button.  
   - They will be directed to the "Select Campus" screen, which currently supports parking bookings only for the Wallumattagal Campus.  
   - Upon selecting a campus, users will be prompted to enter additional details such as vehicle information and desired parking time.  
   - Once the details are submitted, users will see a screen displaying their parking pass, which includes all relevant details like location, duration, and vehicle information.  
   - To extend the parking pass duration, users can use the "Extend Time" button to navigate to a new screen where they can specify the number of additional hours required.  
   - After confirming the additional hours, they will be returned to the parking pass screen with the updated pass details.  
   - The "Cancel" button allows users to cancel their parking pass, returning them to the home page and removing their current pass from the database.  
   - Users can also press the "Home" button to return to the home page, storing the current parking pass for future reference.

2. **Wallumattagal Campus Map**:  
   - By clicking this button, users can view a detailed map of the university's main campus, highlighting major buildings, landmarks, and parking areas.

3. **Parking History**:  
   - The "Parking History" button provides access to a screen listing all previous parking passes that the user has booked.  
   - Users can individually remove specific parking passes or clear their entire parking history.

4. **Log Out**:  
   - This button logs the user out of the application, redirecting them to the sign-in screen.

5. **Theme Switcher**:  
   - Located on the top bar of the home page, the theme switcher allows users to toggle between system and custom themes. Initially, the application follows the system theme but can be customized.

### Design Differences from Initial Deliverable:

- The current app largely follows the design and layout of the initial mockup and prototype.  
- New additions include sign-in/sign-out pages, parking history management, and the campus map, each following similar design principles and layout.

### Development and Testing Information:

- The app was developed and tested on the Android Studio simulator and Chrome browser.  
- It is compatible with Android devices and web browsers but is currently not compatible with iOS devices.

### Core Features (CRUD Operations):

1. **Create**: Users can create a new parking pass.
2. **Read**: Users can view their parking passes on the screen after providing details.
3. **Update**: Users can extend their parking pass duration.
4. **Delete**: Users can cancel their current parking pass or delete old passes from the parking history.

### Technical Details:

1. **User Authentication**:  
   - Google Firebase is used for user login and sign-up functionality, leveraging the Firebase API to validate users via email and password or create new accounts.

2. **Data Management**:  
   - SQL & SQLite plugins for Flutter are used to store user data, particularly parking pass information.  
   - SQL queries support data creation, retrieval, updates, and deletions using SQLite.  
   - A singleton pattern ensures that only a single database instance is created for data management.

3. **Testing**:  
   - Multiple tests have been incorporated to ensure smooth transactions and data integrity.

4. **Multidex Support**:  
   - Flutter multidex support ensures seamless plugin and API integration, preventing compatibility issues.

### Future Updates:

- Future versions will expand the feature set to include coffee ordering, messaging, room booking, and other services for a more comprehensive campus experience.
