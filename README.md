# Metal Tutorials
This repository contains a [Swift](https://developer.apple.com/swift/) and [Metal](https://developer.apple.com/metal/) implementation of the [Lightweight Java Game Library](https://www.lwjgl.org/) (LWJGL) [OpenGL tutorials](https://www.youtube.com/playlist?list=PLRIWtICgwaX0u7Rf9zkZhLoLuZVfUksDP) by [Thin Matrix](https://www.youtube.com/user/ThinMatrix/).  I'd been trying to learn 3D graphics programming for a while when I came across these tutorials.  I found the explanations very clear and understandable, but unfortunately I had no interest in learning Java and the LWJGL, I wanted to learn Swift and Metal.  As a learning exercise I decided to implement the tutorials using Swift, Metal, [MetalKit](https://developer.apple.com/documentation/metalkit), and [ModelIO](https://developer.apple.com/documentation/modelio) - the first party frameworks provided by Apple for iOS, macOS, and tvOS.

Thin Matrix makes his living as an Indie Game Developer, so if you find these tutorials useful you should send him some money using [Patreon](https://www.patreon.com/thinmatrix) or buy his game [Equilinox](https://equilinox.com/).  You can also follow Thin Matrix on Twitter [@ThinMatrix](https://twitter.com/thinmatrix).

## Resources
I've created a seperate [document](https://github.com/keithsharp/Metal-Tutorial/blob/master/RESOURCES.md) with links to various Metal resources.

## Using the Repository
Check the repsitory out using:
```bash
git clone https://github.com/keithsharp/Metal-Tutorial.git
```
The code at the end of each tutorial can then be identifed by a tag, for example `001` is the tag for the complete code after [tutorial one](https://www.youtube.com/watch?v=VS8wlS9hF8E).

## The Tutorials

### Tutorial 1: The Display
#### Links
+ [Tutorial Video](https://www.youtube.com/watch?v=VS8wlS9hF8E)
+ [Java Implementation](https://github.com/TheThinMatrix/OpenGL-Tutorial-1)
+ [Getting started with Metal tutorial](https://donaldpinckney.com/metal/2018/07/05/metal-intro-1.html)

#### Notes
The combination of NSApplication, NSViewController, and MTKView give us most of the funtionality that needs to be written in the Java example.  The size and position of the window and view are configured in the storyboard, I also changed the type of the view to `MTKView`.  I created a group within Xcode called `Game Engine` where I put all of the engine related files, similar to the `renderEngine` folder in the Java example.

The `MTKView` equivalent of the `updateDisplay` method is `draw(in view: MTKView)`.  By setting the `renderer` as the `MTKView` delegate in `viewDidLoad` this method is called 60 times a second.  There are options to configure this futher - see the [documentation](https://developer.apple.com/documentation/metalkit/mtkview).  In future tutorials I may restruture much of this code to move to an explicit game loop and a manual invocation of `draw`.

### Tutorial 2: VAOs and VBOs
#### Links
+ [Tutorial Video](https://www.youtube.com/watch?v=WMiggUPst-Q)
+ [Java Implementation](https://github.com/TheThinMatrix/OpenGL-Tutorial-2)
+ [Getting started with Metal tutorial](https://donaldpinckney.com/metal/2018/07/05/metal-intro-1.html)

#### Notes
There's not an exact equivalent of OpenGL VAOs and VBOs in Metal.  In Metal the data we want to pass to the GPU is stored in `MTLBuffer` objects and we describe the structure of the data when we make the buffer.  One of the nice features of Metal is that we can create a header file that is shared between our Swift code and our shader code reducing the need to duplicate code which must be kept in sync.  This is done by creating a bridging header and then included our `ShaderDefinitions.h` header file in the bridging header which makes any types available in both Swift and the Metal Shading Language.

I created a `Vertex` struct that is shared between the shaders and the Swift code, you could simplify this by just passing arrays of floats.  In Metal you need to make a draw call for each primitive (triangles in this example), hence the loop in `draw`.  The `draw` function is also a bit overloaded as it's acting as the renderer and the game loop - the code needs restructured to seperate these functions.

I was getting confused by the winding order of Metal (it defaults to clockwise which is different to OpenGL), now that I understand how it works I've been able to simplify the `draw` method in the renderer.  I've committed this with tag `002.1`.

### Tutorial 3: Rendering wth Index Buffers
#### Links
+ [Tutorial Video](https://www.youtube.com/watch?v=z2yFlvkBbmk)
+ [Java Implementation](https://github.com/TheThinMatrix/OpenGL-Tutorial-3)

#### Notes
The concepts and code for rendering with index buffers match almost completely between Metal and OpenGL.
+ `createModelWithDevice` in the loader takes an extra parameter for the indices array.
+ The `RawModel` has a property for the index buffer and the count property now stores the number of indices.
+ The `draw` method in the renderer uses the `drawIndexedPrimitives` method to do the drawing.

### Tutorial 4: Introduction to Shaders
#### Links
+ [Tutorial Video](https://www.youtube.com/watch?v=AyNZG_mqGVE)
+ [Metal Shading Language](https://developer.apple.com/metal/Metal-Shading-Language-Specification.pdf)

#### Notes
There's no code changes as this tutorial provides background on how programmable graphics pipelines and shaders work.  Most of the material applies directly to Metal which uses the Metal Shading Language for coding shaders rather than GLSL.

## Contact and Licence
This code was written by Keith Sharp [kms@passback.co.uk](mailto:kms@passback.co.uk).  You can also follow me on Twitter [@KeithSharp](https://twitter.com/KeithSharp).

The code is released into the public domain using the Unlicence to match the licence that was chosen by Thin Matrix for his [Java code](https://github.com/TheThinMatrix):
```
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
```
