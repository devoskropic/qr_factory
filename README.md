# QR Factory

Some flutter learned things on single project, this one makes simple QR Codes and uses BLoC

## This is more like a notes-guide for myself

I've been working on almost 8 months 'cause I started from zero, tried to learn about
widgets/components, design, how to combine them and you know, basics about design, 
then after being familiar on how to make some basic UI started to add basic functions
over static (stateless) views and a little late started to change between stateless 
and stateful screens, then learned about different ways of navigate and started using
ones and pausing others until I decided to learn one instead of many at once, so next 
paragraph will tell us only about the progress of this repo, while present paragraph 
is talking about my whole procces learning flutter.


At starting point I did some other apps that only had some screens and basic navigation
through push() and pop() events (i. e. in my wbsports app) then I understood a little 
about Navigator and navigating between routes but using only push() and pushReplacement()
applied on my SplashScreen using a future delayed counter to switch to next homepage and 
then I knew about routes and tried to apply it to this QR Factory project including 
factory pattern.

So maybe in the future this repo will grow or maybe I'll decide to separate some of the 
applied things here, to be more flexible into include it on my new repos...


## Version Notes / Change Log

### Ver 2.0.1 at 08/06/2023
> Tried to add bottom navbar bloc but decide it'll be available from another project to
learn how to use bloc for these navigation (feh_bloc_tab A.K.A. BLoC Tabz).

> Gesture Detector added to main in order to hide keyboard when user tabs outside the
textformfields.

> Modified common helper files to improve form views and how to show QR codes, including 
the usage of settings to add a view that let's the user choose between normal or image qr.

> Added some extra validations to textformfields like url regular expressions.

> Tag of version (2.0.0).


### 31/03/2023
> Oops I forgot, but now I'm back, qr_factory repo added to GitHub

> Ok ok, I was checking some code these days and now I'm gonna upload files finally

### 15/03/2023
> Decided to upload files even knowing the project is incomplete, but also knowing
it's time to try new projects and integrate all to learn it well

### 13/03/2023
> Device runing tests

### 10/03/2023
#### Ver. 2.0.0
> MultiBloc Provider and routes added to Main Class

> Removed almost old files

### 09/03/2023
> QR Code Bloc added

### 08/03/2023
> Splash Screen cubit added

### 05/03/2023
> Data folder and subfolders and files structure added to include authentication

> Business Logic added

### 01/03/2023
> Defined Final Project Structure: Business Logic | Data | UI 

> Routes file and folder added

### 26/02/2023
> Separating common to all screen-view components 

> New dependencies for authentication (very probable Auth will never be added on this repo)
   - google_sign_in
   - firebase_auth

### 23/02/2023
#### Ver. 1.2.0
> QrView now include scaffold BottomBar

> Until now my BottomBar content idea is:
   - A HomeScreen (no)
   - Basic QRCode
   - QR Code with image at center (from url or uploaded by user)
   - Settings tab
> New dependencies added:
   - flutter_bloc
   - equatable

### 20/02/2023
#### Ver. 1.1.1
> Startin' point tryin' to learn about BLoC

> Added form to the QR screen 

> Added custom textFormFields to components

> Added Added custom qr code to components

### 14/02/2023
#### Ver. 1.1.0
> Added Custom Splash Screen (not linked to the app flow yet)

> Added Icon to app and App Name
   - both at android/src/main/AndroidManifest.xml 
   - :label and :icon

> New dependencies added:
   - google_fonts
   - google_nav_bar

### 10/02/2023
#### Ver. 1.0.0
> Project created

> Added dependencies:
   - qr_flutter
   - image
   - line_icons 

> Created single QR widget/page