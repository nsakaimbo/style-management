# style-management
A proposed approach to centralizing and managing style attributes on an app-wide basis.

If the design team decides to change the Hex value of a color or font specification on an application-wide basis, it would be nice to have a single point-of-update rather than try to figure out if and where to change these attributes in code or storyboards (or both!). Here's a proposed approach to doing just that. Blog post [here](http://bit.ly/1Tcw0xa).

Think of a global StyleKit (to borrow nomenclature from our friends at Paintcode) with a series of nested structs (i.e structs declared within each other) to represent view controllers and the UI elements they are responsible for. So a StyleKit in your application may look something like:

```
struct StyleKit {

//declare global style attributes at the parent level

    struct Fonts {
        static func regularFont() -> String { return "HelveticaNeue-Medium" }
        static func lightFont() -> String { return "HelveticaNeue-Light" }
        static func boldFont() -> String { return "HelveticaNeue-Bold" }

    struct Colors {
        static func kidnapper() -> UIColor { return UIColor(redValue: 229.0, greenValue: 236.0, blueValue: 219.0, alpha: 1.0) }
        static func potPourri() -> UIColor { return UIColor(redValue: 242.0, greenValue: 221.0, blueValue: 213.0, alpha: 1.0) }
    }      

    // dependent attributes point to the parent struct
    struct ViewController {

       static func labelFont() -> UIFont {
       return UIFont(name: StyleKit.Fonts.boldFont(), size: 15.0)!
       }
    }    
 }
```

As shown above, they key to making this approach work is ensuring that our child structs point to the parent when a global attribute (such as a font or color) is used. This way, if we decide to update an attribute on an app-wide basis, we only need to change it in one place!

Provided one takes care to populate his/her attributes this way, I've found this approach can be incredibly versatile and efficient from a readability and a computational perspective for the following reasons:

1. We get the benefit of a very convenient and logical _dot notation_ to represent our hierarchy of UI elements, with the bonus of Xcode's autocomplete. This can save precious minutes (or hours!) of having to switch back-and-forth between separate documents/files and/or rely upon one's own memory when changing attributes on-the-fly.
2. Note the use of static functions vs. static constants. In general, we probably don't want to initialize style attributes within their struct containers as static constants since we wouldn't want the unnecessary overhead of having instantiated properties floating out in memory when not in use. However, for expensive, frequently-used objects (e.g. `NSDateFormatters`), consider the static let approach, which lazily instantiates objects only if and when they are first called.
3. _Standardization_. It makes it much easier for you and your teammates to navigate project files when a clear, consistent set of guidelines are established to manage design attributes on a global basis.

Would love to hear your thoughts as well as learn about other best practices out there. Please share any comments and suggestions for improvement, and pull requests are very welcome! 
