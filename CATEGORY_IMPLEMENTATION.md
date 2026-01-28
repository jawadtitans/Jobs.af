# Category Page and 3D Animated Drawer Implementation

This document describes the implementation of the category page and 3D animated drawer functionality for the jobs app.

## Features Implemented

### 1. Category Page (`lib/screens/category/category_page.dart`)
- **Persian UI**: Right-to-left layout with Persian text
- **Service Categories**: 
  - Special Services (سرویس های ویژه)
    - استیکینگ تتر (Tether Staking)
    - خرید گیفت کارت (Buy Gift Card)
    - سواپ ارز دیجیتال (Digital Currency Swap)
    - معامله سریع (Quick Transaction)
    - معاملات حرفه ای (Professional Transactions)
    - تبدیل دارایی های خرد (Convert Small Assets)
  - Charge and Bill Services (خدمات شارژ و قبوض)
    - خرید شارژ (Buy Charge)
- **Navigation**: Each category navigates to search page with category filter
- **Design**: Clean white cards with colored icons and shadows

### 2. 3D Animated Drawer (`lib/screens/home/widgets/animated_drawer.dart`)
- **3D Animation**: Perspective transform with rotation and scaling
- **Smooth Transitions**: 300ms animation duration with easing curves
- **Drawer Content**: 
  - User profile section
  - Navigation menu items (Home, Search, Categories, Favorites, Settings, Help, Logout)
  - Gradient background
- **Interactive**: Tap outside to close, menu items navigate to respective pages

### 3. Updated App Bar (`lib/screens/home/widgets/customeAPPBar_with_drawer.dart`)
- **Drawer Toggle**: Category icon toggles between open/close states
- **3D Effect**: Main content scales and rotates when drawer is open
- **Search Integration**: Search bar with filter functionality
- **Theme Support**: Dark/light mode toggle

### 4. Enhanced Search Page (`lib/screens/search/search_with_category.dart`)
- **Category Filtering**: Shows jobs filtered by selected category
- **Query Parameters**: Supports both category and text search
- **Filter Chips**: Visual category indicators with remove functionality
- **Mock Data**: Sample job listings for demonstration
- **Responsive Design**: Empty state handling and proper layout

### 5. Updated Routing (`lib/utils/app_routes.dart`)
- **Category Route**: `/category` for category page
- **Search Route**: `/search` with query parameter support
- **Navigation**: Seamless navigation between pages
- **Query Parameters**: Support for category and search query filtering

## Usage

### Opening the Drawer
1. Tap the category icon in the home page app bar
2. The drawer slides in from the left with 3D animation
3. Main content scales down and rotates slightly

### Navigating to Categories
1. From drawer: Tap "دسته‌بندی‌ها" (Categories)
2. From home: The category icon now opens the drawer instead of direct navigation

### Using Category Filters
1. Open category page
2. Tap any service card
3. Navigate to search page with category filter applied
4. Jobs are filtered by the selected category

### Search with Categories
1. Use the search bar in home page
2. Or navigate to search page directly
3. Apply category filters using the filter chips
4. Remove filters by tapping the X on filter chips

## Technical Details

### Animation Implementation
- Uses `AnimationController` with `TickerProviderStateMixin`
- Multiple animations: scale, rotation, and slide
- Perspective transform for 3D effect
- Smooth easing curves for natural feel

### State Management
- Drawer state managed in `CustomAppBarWithDrawer`
- Category filtering handled in `SearchWithCategory`
- Navigation state preserved across page transitions

### Design Patterns
- Widget composition for reusable components
- Stateful widgets for animation control
- Provider pattern for theme management
- GoRouter for navigation management

## Files Created/Modified

### New Files
- `lib/screens/category/category_page.dart`
- `lib/screens/home/widgets/animated_drawer.dart`
- `lib/screens/home/widgets/customeAPPBar_with_drawer.dart`
- `lib/screens/search/search_with_category.dart`

### Modified Files
- `lib/screens/home/home_page.dart` - Updated to use new app bar
- `lib/utils/app_routes.dart` - Added new routes and query parameter support

## Future Enhancements
- Real job data integration
- Advanced filtering options
- User preferences for categories
- Analytics for category usage
- Offline support for categories
