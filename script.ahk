global X := "image.png"
global Yx := 0
global Yy := 0
global Zx := 0
global Zy := 0

main(iteration) { ; define main function
  CoordMode Pixel ; use screen coordinates
  ImageSearch, xCoord, yCoord, 0, 0, A_ScreenWidth, A_ScreenHeight, %X% ; scan screen for X image
  if (not ErrorLevel) { ; if X image was found
    Click, %Yx%, %Yy% ; click at Y coordinates
    Tooltip, Image found!
  } else if (ErrorLevel) { ; if image NOT found 
    if (iteration = 0) {
      Tooltip, Image NOT found! (iteration 0)
      Send, {WheelDown} ; scroll mouse wheel down
      iteration++ 
    } else {
      Tooltip, Image NOT found! (iteration 1)
      Click, %Zx%, %Zy% ; click at Z coordinates
      iteration = 0
    }
    main(iteration) ; start over
  }
}

main(0) ; run main function