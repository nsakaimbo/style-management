# style-management
<p align="center">
<img src="/StyleManagement/Assets.xcassets/AppIcon.appiconset/AppIcon60pt%403x.png"</img>
</p>
I'm still exploring ways to more efficiently centralize and manage style attributes in my projects. The goal is to be able to change style attributes in as few places as possible whenever an update is made. For example, in an ideal world, if the design team decides to change the Hex value of a color or font specification on an application-wide basis, it would be nice to have a single point-of-update rather than try to figure out if and where to change these attributes in code or storyboards (or both!).

Lately, I've been gravitating toward using storyboards as a prototyping and wireframing tool, and setting and updating my style attributes in code. I'm sharing a few approaches I've come across recently. How exactly they're applied in practice is up to the individual developer or team, but hopefully someone out there finds some of these tips and tricks as useful as I did. The example project includes a couple of examples that make use of:

  * `UIAppearance` proxy
  * Global namespaced constants
  * Setting styles attributes in property observers (`willSet` and `didSet`)

Please refer to [my blog post](http://bit.ly/1Tcw0xa) for further elaboration of each of the above.

Would love to hear your thoughts as well as learn about other best practices out there. Please share any comments and suggestions for improvement, and pull requests are very welcome! 
