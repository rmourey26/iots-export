module IOTS.Leijen where

import           Data.Text                    (Text)
import qualified Data.Text                    as Text
import           Text.PrettyPrint.Leijen.Text (Doc, braces, brackets, comma,
                                               displayTStrict, indent,
                                               linebreak, parens, punctuate,
                                               renderPretty, textStrict, vsep)

render :: Doc -> Text
render = displayTStrict . renderPretty 0.8 200

stringDoc :: String -> Doc
stringDoc = textStrict . Text.pack

indentedList :: [Doc] -> Doc
indentedList = inset . vsep . punctuate comma

inset :: Doc -> Doc
inset doc = linebreak <> indent 4 doc <> linebreak

jsArray :: [Doc] -> Doc
jsArray = brackets . indentedList

jsObject :: [Doc] -> Doc
jsObject = braces . indentedList

jsParams :: [Doc] -> Doc
jsParams = parens . indentedList

upperFirst :: Text -> Text
upperFirst txt = Text.toUpper start <> end
  where
    (start, end) = Text.splitAt 1 txt

lowerFirst :: Text -> Text
lowerFirst txt = Text.toLower start <> end
  where
    (start, end) = Text.splitAt 1 txt