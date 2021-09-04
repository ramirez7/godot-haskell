{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Popup
       (Godot.Core.Popup._NOTIFICATION_POST_POPUP,
        Godot.Core.Popup._NOTIFICATION_POPUP_HIDE,
        Godot.Core.Popup.sig_about_to_show,
        Godot.Core.Popup.sig_popup_hide, Godot.Core.Popup.is_exclusive,
        Godot.Core.Popup.popup, Godot.Core.Popup.popup_centered,
        Godot.Core.Popup.popup_centered_clamped,
        Godot.Core.Popup.popup_centered_minsize,
        Godot.Core.Popup.popup_centered_ratio,
        Godot.Core.Popup.set_as_minsize, Godot.Core.Popup.set_exclusive)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Control()

_NOTIFICATION_POST_POPUP :: Int
_NOTIFICATION_POST_POPUP = 80

_NOTIFICATION_POPUP_HIDE :: Int
_NOTIFICATION_POPUP_HIDE = 81

sig_about_to_show :: Godot.Internal.Dispatch.Signal Popup
sig_about_to_show = Godot.Internal.Dispatch.Signal "about_to_show"

instance NodeSignal Popup "about_to_show" '[]

-- | Emitted when a popup is hidden.
sig_popup_hide :: Godot.Internal.Dispatch.Signal Popup
sig_popup_hide = Godot.Internal.Dispatch.Signal "popup_hide"

instance NodeSignal Popup "popup_hide" '[]

instance NodeProperty Popup "popup_exclusive" Bool 'False where
        nodeProperty
          = (is_exclusive, wrapDroppingSetter set_exclusive, Nothing)

{-# NOINLINE bindPopup_is_exclusive #-}

bindPopup_is_exclusive :: MethodBind
bindPopup_is_exclusive
  = unsafePerformIO $
      withCString "Popup" $
        \ clsNamePtr ->
          withCString "is_exclusive" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_exclusive :: (Popup :< cls, Object :< cls) => cls -> IO Bool
is_exclusive cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopup_is_exclusive (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Popup "is_exclusive" '[] (IO Bool) where
        nodeMethod = Godot.Core.Popup.is_exclusive

{-# NOINLINE bindPopup_popup #-}

bindPopup_popup :: MethodBind
bindPopup_popup
  = unsafePerformIO $
      withCString "Popup" $
        \ clsNamePtr ->
          withCString "popup" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

popup ::
        (Popup :< cls, Object :< cls) => cls -> Maybe Rect2 -> IO ()
popup cls arg1
  = withVariantArray
      [defaultedVariant VariantRect2 (V2 (V2 0 0) (V2 0 0)) arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopup_popup (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Popup "popup" '[Maybe Rect2] (IO ()) where
        nodeMethod = Godot.Core.Popup.popup

{-# NOINLINE bindPopup_popup_centered #-}

bindPopup_popup_centered :: MethodBind
bindPopup_popup_centered
  = unsafePerformIO $
      withCString "Popup" $
        \ clsNamePtr ->
          withCString "popup_centered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

popup_centered ::
                 (Popup :< cls, Object :< cls) => cls -> Maybe Vector2 -> IO ()
popup_centered cls arg1
  = withVariantArray [defaultedVariant VariantVector2 (V2 0 0) arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopup_popup_centered (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Popup "popup_centered" '[Maybe Vector2] (IO ())
         where
        nodeMethod = Godot.Core.Popup.popup_centered

{-# NOINLINE bindPopup_popup_centered_clamped #-}

bindPopup_popup_centered_clamped :: MethodBind
bindPopup_popup_centered_clamped
  = unsafePerformIO $
      withCString "Popup" $
        \ clsNamePtr ->
          withCString "popup_centered_clamped" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

popup_centered_clamped ::
                         (Popup :< cls, Object :< cls) =>
                         cls -> Maybe Vector2 -> Maybe Float -> IO ()
popup_centered_clamped cls arg1 arg2
  = withVariantArray
      [defaultedVariant VariantVector2 (V2 0 0) arg1,
       maybe (VariantReal (0.75)) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopup_popup_centered_clamped
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Popup "popup_centered_clamped"
           '[Maybe Vector2, Maybe Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Popup.popup_centered_clamped

{-# NOINLINE bindPopup_popup_centered_minsize #-}

bindPopup_popup_centered_minsize :: MethodBind
bindPopup_popup_centered_minsize
  = unsafePerformIO $
      withCString "Popup" $
        \ clsNamePtr ->
          withCString "popup_centered_minsize" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

popup_centered_minsize ::
                         (Popup :< cls, Object :< cls) => cls -> Maybe Vector2 -> IO ()
popup_centered_minsize cls arg1
  = withVariantArray [defaultedVariant VariantVector2 (V2 0 0) arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopup_popup_centered_minsize
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Popup "popup_centered_minsize" '[Maybe Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.Popup.popup_centered_minsize

{-# NOINLINE bindPopup_popup_centered_ratio #-}

bindPopup_popup_centered_ratio :: MethodBind
bindPopup_popup_centered_ratio
  = unsafePerformIO $
      withCString "Popup" $
        \ clsNamePtr ->
          withCString "popup_centered_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

popup_centered_ratio ::
                       (Popup :< cls, Object :< cls) => cls -> Maybe Float -> IO ()
popup_centered_ratio cls arg1
  = withVariantArray [maybe (VariantReal (0.75)) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopup_popup_centered_ratio (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Popup "popup_centered_ratio" '[Maybe Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Popup.popup_centered_ratio

{-# NOINLINE bindPopup_set_as_minsize #-}

bindPopup_set_as_minsize :: MethodBind
bindPopup_set_as_minsize
  = unsafePerformIO $
      withCString "Popup" $
        \ clsNamePtr ->
          withCString "set_as_minsize" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_as_minsize :: (Popup :< cls, Object :< cls) => cls -> IO ()
set_as_minsize cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopup_set_as_minsize (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Popup "set_as_minsize" '[] (IO ()) where
        nodeMethod = Godot.Core.Popup.set_as_minsize

{-# NOINLINE bindPopup_set_exclusive #-}

bindPopup_set_exclusive :: MethodBind
bindPopup_set_exclusive
  = unsafePerformIO $
      withCString "Popup" $
        \ clsNamePtr ->
          withCString "set_exclusive" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_exclusive ::
                (Popup :< cls, Object :< cls) => cls -> Bool -> IO ()
set_exclusive cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopup_set_exclusive (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Popup "set_exclusive" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Popup.set_exclusive