module ColorHelper exposing (Color, rgbFromColor, rgbaFromColor, fromCSSHexRGB, fromCSSHexRGBA, rgbFromString, rgbaFromString)
import Dict exposing (Dict)
import Bitwise
import List

type Color = 
  RGB Int Int Int | RGBA Int Int Int Float

rgbFromString: String -> (Int -> Int -> Int -> a) -> a
rgbFromString hexcode transform = 
    rgbFromColor (fromCSSHexRGB hexcode) transform 

rgbaFromString: String -> (Int -> Int -> Int -> Float -> a) -> a
rgbaFromString hexcode transform = 
    rgbaFromColor (fromCSSHexRGBA hexcode) transform


rgbFromColor: Color -> (Int -> Int -> Int -> a) -> a
rgbFromColor color func = 
  case color of 
    RGB r g b -> 
      func r g b
    RGBA r g b _ ->
      func r g b
      
rgbaFromColor: Color -> (Int -> Int -> Int -> Float -> a) -> a
rgbaFromColor color func =
  case color of 
    RGBA r g b a ->
      func r g b a
    RGB r g b ->
      func r g b 1.0

fromCSSHexRGB: String -> Color
fromCSSHexRGB hexcode =
  RGB (getRed hexcode) (getGreen hexcode) (getBlue hexcode)

fromCSSHexRGBA : String -> Color
fromCSSHexRGBA hexcode =
  RGBA (getRed hexcode) (getGreen hexcode) (getBlue hexcode) (toFloat (getAlpha hexcode)/255)

  
getRed: String -> Int
getRed hexcode = 
  fromList (List.take 2 (fromCSSString hexcode))
  
getGreen: String -> Int
getGreen hexcode = 
  fromList (List.take 2 (List.drop 2 (fromCSSString hexcode)))
  

getBlue: String -> Int
getBlue hexcode = 
  fromList (List.take 2 (List.drop 4 (fromCSSString hexcode)))
  
getAlpha: String -> Int
getAlpha hexcode = 
  fromList (List.take 2 (List.drop 6 (fromCSSString hexcode)))

fromCSSString: String -> List Char
fromCSSString hexcode = 
    (List.drop 1 (String.toList hexcode))

fromList: List Char -> Int
fromList chars =
  List.sum (List.indexedMap (\i v -> Bitwise.shiftLeftBy (i*4) v) (List.reverse (List.map fromChar chars)))

fromChar: Char -> Int
fromChar ch =
  case Dict.get ch hexmap of 
    Just v ->
      v
    Nothing ->
      0

hexmap: Dict Char Int
hexmap =
  Dict.fromList 
  [ ('0', 0)
  , ('1', 1)
  , ('2', 2)
  , ('3', 3)
  , ('4', 4)
  , ('5', 5)
  , ('6', 6)
  , ('7', 7)
  , ('8', 8)
  , ('9', 9)
  , ('A', 10)
  , ('B', 11)
  , ('C', 12)
  , ('D', 13)
  , ('E', 14)
  , ('F', 15)
  , ('a', 10)
  , ('b', 11)
  , ('c', 12)
  , ('d', 13)
  , ('e', 14)
  , ('f', 15)
  ]
