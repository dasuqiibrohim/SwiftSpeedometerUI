# 🎨 SwiftUI is Code as Art

For me, **SwiftUI is not just about composing app interfaces, it's about crafting art through code.**
From my experience working on this task, I truly felt that:
- I can define **fonts**, **colors**, **shadows**, and **gradients** as part of a **design system**, and reference them in an expressive and consistent way.
- Implementing designs from **Figma to SwiftUI** can be **highly accurate and fast**, especially when the structure and styles are **semantically prepared**.
- I really enjoy a **clean, well-organized folder structure** broken down by responsibility such as **Components**, **Modifiers**, **Styles**, and **Views**. It makes the codebase easier to **read**, **maintain**, and **scale**.
- SwiftUI allows us to apply principles like **Single Responsibility** and **Separation of Concerns** in a very natural way.
- With a **clean and predictable architecture**, we can build **complex UIs** that still feel **lightweight**, **modular**, and **elegant**.


I believe that good code should:
- Be **easy to read**
- Have a **single responsibility**
- Follow a **consistent UI architecture**
- Feel **seamlessly integrated with design**

> I believe that **code is art**, and **SwiftUI gives us the perfect canvas** to write UI that is **beautiful**, **modular**, and **satisfying both technically and visually**.



# 🎨 Styling Implementation
Here’s the approach I used in this project to manage **fonts**, **colors**, and **gradients** consistently.  
The naming follows the structure defined in **Figma**, so that layouting remains accurate and visually aligned.  
This also makes global changes easier and faster across the entire app.

## 🔤 Font Style
Use the extension `font(.headline1)` to apply global custom fonts, such as **RobotoCondensed** or any other predefined style.
```swift
Text("25K")
    .font(.headline1)
```

## 🎨 Color Styling
Colors are managed through **color assets** or via a custom `Color` extension, such as `.baseBlue` and `.baseWhite`, to ensure consistency throughout the UI.
```swift
Text("25K")
    .foregroundColor(.baseWhite)
    .background(Color.baseBlue)
```

## 🌈 Gradient & Inner Shadow
For UI elements like **circles** or **buttons**, gradients and shadow effects can be applied using:
```swift
Circle()
    .fill(.customLinearGradient)
    .innerShadow()
```

# 🗂️ Project Architecture & Folder Structure
I always build projects using a **Clean Architecture approach** by separating concerns across multiple layers.  
The goal is to improve **scalability**, **readability**, and **testability** of the codebase.

<table>
  <tr>
    <td valign="top">
      <img src="https://github.com/user-attachments/assets/03ad791e-65e1-491f-bcc4-90486c4c83bf" width="300"/>
    </td>
    <td valign="top">
      <img src="https://github.com/user-attachments/assets/ebe793c3-4a26-486f-bb42-d0ff92fedb5d" width="300"/>
    </td>
  </tr>
</table>

# 🎥 Project Walkthrough
<table>
  <tr>
    <td valign="top" align="center" width="50%">
      <a href="https://drive.google.com/file/d/12HJtKOLvQIVMpaZxT-m5XVhByqmSQD3h/view?usp=sharing" target="_blank">
        🎬 <b>Watch Demo Video</b><br/>
        <img src="https://img.icons8.com/ios-filled/100/000000/youtube-play.png" width="60" alt="Play Icon"/>
      </a>
    </td>
    <td valign="top" align="center" width="50%">
      <img src="https://github.com/user-attachments/assets/2a0bc385-04e1-4079-a16f-dce68e8f17ee" width="250"/><br/>
      <sub><b>📱 UI Screenshot</b></sub>
    </td>
  </tr>
</table>
