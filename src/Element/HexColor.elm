module Element.HexColor exposing (rgbaHex, rgbHex)

import Element exposing (Color, rgba255, rgb255)
import ColorHelper

rgbaHex: String -> Color
rgbaHex hexcode = 
    ColorHelper.rgbaFromString hexcode rgba255

rgbHex: String -> Color
rgbHex hexcode = 
    ColorHelper.rgbFromString hexcode rgb255