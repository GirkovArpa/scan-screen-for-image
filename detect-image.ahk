main() { ; define main function
  CoordMode Pixel ; use screen coordinates
  ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, image.png ; scan screen for image.png
  if (not ErrorLevel) { ; if image was found
    Click, 13, 37 ; click at coordinates 13, 37
  } else if (ErrorLevel) { ; if image NOT found 
    Send, {WheelDown} ; scroll mouse wheel down
    main() ; start over
  }
}

main() ; run main function