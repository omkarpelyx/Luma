# 📸 How to Add Your Event Images

## ✅ What I've Done

I've set up the project to use local asset images for events. Now you just need to save your 3 images to the correct location.

---

## 📁 Step 1: Save Your Images

Save the 3 images you uploaded to this folder:

```
luma_event_app/
└── assets/
    └── images/
        ├── event1.jpg  ← Tech Summit image (purple lighting)
        ├── event2.jpg  ← Illustrated people image (colorful)
        └── event3.jpg  ← Speaker silhouette image (blue gradient)
```

### Image Details:
- **event1.jpg** - Tech Summit with purple lighting and panel discussion
- **event2.jpg** - Colorful illustration with people and speech bubbles
- **event3.jpg** - Speaker silhouette with blue gradient background

---

## 🎯 Step 2: How Images Are Used

The events will cycle through these 3 images:

| Event | Image Used |
|-------|------------|
| Code & Connect 3.0 | event1.jpg |
| FutureXcon | event2.jpg |
| Founders' Stories | event3.jpg |
| Stable Money Tour | event1.jpg |
| AI Summit 2024 | event2.jpg |
| Climate Action | event3.jpg |

---

## 💻 Step 3: Run the App

```bash
# After saving the images, run:
flutter pub get
flutter run
```

The event cards will now show your beautiful images! 🎨

---

## 🔧 What's Been Updated

### 1. **pubspec.yaml** ✅
Added assets configuration:
```yaml
flutter:
  assets:
    - assets/images/
```

### 2. **event_dummy_datasource.dart** ✅
Updated all events to use local images:
```dart
imageUrl: 'assets/images/event1.jpg',
```

### 3. **event_card.dart** ✅
Updated to handle both network and asset images:
```dart
event.imageUrl.startsWith('assets/')
    ? Image.asset(event.imageUrl, fit: BoxFit.cover)
    : Image.network(event.imageUrl, fit: BoxFit.cover)
```

---

## 📝 Manual Steps (What You Need to Do)

### Option 1: Using File Explorer (Easiest)

1. Open your project folder: `C:\Users\Omkar\luma_event_app\`
2. Create folder: `assets\images\`
3. Save your 3 images there:
   - Rename first image (purple tech summit) → `event1.jpg`
   - Rename second image (colorful illustration) → `event2.jpg`
   - Rename third image (speaker silhouette) → `event3.jpg`
4. Run `flutter pub get`
5. Run `flutter run`

### Option 2: Using Command Line

```bash
# Create the directory
mkdir -p assets/images

# Copy your images (adjust paths as needed)
# Then rename them to event1.jpg, event2.jpg, event3.jpg
```

---

## 🎨 Image Requirements

- **Format**: JPG, PNG, or WebP
- **Size**: Recommended 800x400px or similar aspect ratio (2:1)
- **File size**: Keep under 500KB for best performance
- **Names**: Must be exactly `event1.jpg`, `event2.jpg`, `event3.jpg`

---

## ✅ Verification

After adding images, you should see:

1. ✅ Event cards with real images (not placeholders)
2. ✅ Images load instantly (no network delay)
3. ✅ Beautiful event cards matching your design

---

## 🐛 Troubleshooting

### Images not showing?

1. **Check file names** - Must be exactly `event1.jpg`, `event2.jpg`, `event3.jpg`
2. **Check location** - Must be in `assets/images/` folder
3. **Run pub get** - Run `flutter pub get` after adding images
4. **Hot restart** - Press `R` (capital R) in terminal, not just `r`
5. **Clean build** - Run `flutter clean` then `flutter pub get` then `flutter run`

### Still seeing placeholders?

The app will show a placeholder icon if:
- Image file doesn't exist
- Image file name is wrong
- Assets not declared in pubspec.yaml (already done ✅)

---

## 🎉 Result

Once you add the images, your event cards will look amazing with:
- ✅ Real event images
- ✅ Fast loading (local assets)
- ✅ Professional appearance
- ✅ No internet required

---

## 💡 Want to Add More Images?

1. Add more images to `assets/images/`
2. Update `event_dummy_datasource.dart`:
   ```dart
   imageUrl: 'assets/images/your_new_image.jpg',
   ```
3. Run `flutter pub get`
4. Hot restart

---

## 📚 Summary

**What's Done:**
- ✅ Assets folder configured
- ✅ Event data updated to use local images
- ✅ EventCard widget updated to display assets
- ✅ pubspec.yaml configured

**What You Need to Do:**
1. Save 3 images to `assets/images/` folder
2. Name them: `event1.jpg`, `event2.jpg`, `event3.jpg`
3. Run `flutter pub get`
4. Run `flutter run`

**That's it!** Your events will have beautiful images! 🎨✨
