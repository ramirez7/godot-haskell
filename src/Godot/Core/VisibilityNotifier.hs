{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisibilityNotifier
       (Godot.Core.VisibilityNotifier.sig_camera_entered,
        Godot.Core.VisibilityNotifier.sig_camera_exited,
        Godot.Core.VisibilityNotifier.sig_screen_entered,
        Godot.Core.VisibilityNotifier.sig_screen_exited,
        Godot.Core.VisibilityNotifier.get_aabb,
        Godot.Core.VisibilityNotifier.is_on_screen,
        Godot.Core.VisibilityNotifier.set_aabb)
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
import Godot.Core.Spatial()

sig_camera_entered ::
                   Godot.Internal.Dispatch.Signal VisibilityNotifier
sig_camera_entered
  = Godot.Internal.Dispatch.Signal "camera_entered"

instance NodeSignal VisibilityNotifier "camera_entered" '[Camera]

sig_camera_exited ::
                  Godot.Internal.Dispatch.Signal VisibilityNotifier
sig_camera_exited = Godot.Internal.Dispatch.Signal "camera_exited"

instance NodeSignal VisibilityNotifier "camera_exited" '[Camera]

sig_screen_entered ::
                   Godot.Internal.Dispatch.Signal VisibilityNotifier
sig_screen_entered
  = Godot.Internal.Dispatch.Signal "screen_entered"

instance NodeSignal VisibilityNotifier "screen_entered" '[]

sig_screen_exited ::
                  Godot.Internal.Dispatch.Signal VisibilityNotifier
sig_screen_exited = Godot.Internal.Dispatch.Signal "screen_exited"

instance NodeSignal VisibilityNotifier "screen_exited" '[]

instance NodeProperty VisibilityNotifier "aabb" Aabb 'False where
        nodeProperty = (get_aabb, wrapDroppingSetter set_aabb, Nothing)

{-# NOINLINE bindVisibilityNotifier_get_aabb #-}

bindVisibilityNotifier_get_aabb :: MethodBind
bindVisibilityNotifier_get_aabb
  = unsafePerformIO $
      withCString "VisibilityNotifier" $
        \ clsNamePtr ->
          withCString "get_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_aabb ::
           (VisibilityNotifier :< cls, Object :< cls) => cls -> IO Aabb
get_aabb cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisibilityNotifier_get_aabb (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisibilityNotifier "get_aabb" '[] (IO Aabb)
         where
        nodeMethod = Godot.Core.VisibilityNotifier.get_aabb

{-# NOINLINE bindVisibilityNotifier_is_on_screen #-}

bindVisibilityNotifier_is_on_screen :: MethodBind
bindVisibilityNotifier_is_on_screen
  = unsafePerformIO $
      withCString "VisibilityNotifier" $
        \ clsNamePtr ->
          withCString "is_on_screen" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_on_screen ::
               (VisibilityNotifier :< cls, Object :< cls) => cls -> IO Bool
is_on_screen cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisibilityNotifier_is_on_screen
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisibilityNotifier "is_on_screen" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.VisibilityNotifier.is_on_screen

{-# NOINLINE bindVisibilityNotifier_set_aabb #-}

bindVisibilityNotifier_set_aabb :: MethodBind
bindVisibilityNotifier_set_aabb
  = unsafePerformIO $
      withCString "VisibilityNotifier" $
        \ clsNamePtr ->
          withCString "set_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_aabb ::
           (VisibilityNotifier :< cls, Object :< cls) => cls -> Aabb -> IO ()
set_aabb cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisibilityNotifier_set_aabb (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisibilityNotifier "set_aabb" '[Aabb] (IO ())
         where
        nodeMethod = Godot.Core.VisibilityNotifier.set_aabb