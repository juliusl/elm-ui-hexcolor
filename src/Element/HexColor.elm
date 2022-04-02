module Element.HexColor exposing (rgbaCSSHex, rgbCSSHex)
{-| This module just adds two helper functions to convert CSS hex strings into a elm-ui Color

# CSS Color Helpers
@docs rgbaCSSHex, rgbCSSHex

-}

import Element exposing (Color, rgba255, rgb255)
import ColorHelper

{-| Convert a CSS Hex color into an elm-ui.Element.Color with rgba255 
    rgbaCSSHex "#7f11e088"
-}
rgbaCSSHex: String -> Color
rgbaCSSHex hexcode = 
    ColorHelper.rgbaFromString hexcode rgba255


{-| Convert a CSS Hex color into an elm-ui.Element.Color with rgb255 
    rgbCSSHex "#7f11E0"
-}
rgbCSSHex: String -> Color
rgbCSSHex hexcode = 
    ColorHelper.rgbFromString hexcode rgb255