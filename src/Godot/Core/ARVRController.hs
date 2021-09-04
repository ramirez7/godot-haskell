{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ARVRController
       (Godot.Core.ARVRController.sig_button_pressed,
        Godot.Core.ARVRController.sig_button_release,
        Godot.Core.ARVRController.sig_mesh_updated,
        Godot.Core.ARVRController.get_controller_id,
        Godot.Core.ARVRController.get_controller_name,
        Godot.Core.ARVRController.get_hand,
        Godot.Core.ARVRController.get_is_active,
        Godot.Core.ARVRController.get_joystick_axis,
        Godot.Core.ARVRController.get_joystick_id,
        Godot.Core.ARVRController.get_mesh,
        Godot.Core.ARVRController.get_rumble,
        Godot.Core.ARVRController.is_button_pressed,
        Godot.Core.ARVRController.set_controller_id,
        Godot.Core.ARVRController.set_rumble)
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

sig_button_pressed :: Godot.Internal.Dispatch.Signal ARVRController
sig_button_pressed
  = Godot.Internal.Dispatch.Signal "button_pressed"

instance NodeSignal ARVRController "button_pressed" '[Int]

sig_button_release :: Godot.Internal.Dispatch.Signal ARVRController
sig_button_release
  = Godot.Internal.Dispatch.Signal "button_release"

instance NodeSignal ARVRController "button_release" '[Int]

sig_mesh_updated :: Godot.Internal.Dispatch.Signal ARVRController
sig_mesh_updated = Godot.Internal.Dispatch.Signal "mesh_updated"

instance NodeSignal ARVRController "mesh_updated" '[Mesh]

instance NodeProperty ARVRController "controller_id" Int 'False
         where
        nodeProperty
          = (get_controller_id, wrapDroppingSetter set_controller_id,
             Nothing)

instance NodeProperty ARVRController "rumble" Float 'False where
        nodeProperty = (get_rumble, wrapDroppingSetter set_rumble, Nothing)

{-# NOINLINE bindARVRController_get_controller_id #-}

bindARVRController_get_controller_id :: MethodBind
bindARVRController_get_controller_id
  = unsafePerformIO $
      withCString "ARVRController" $
        \ clsNamePtr ->
          withCString "get_controller_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_controller_id ::
                    (ARVRController :< cls, Object :< cls) => cls -> IO Int
get_controller_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRController_get_controller_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRController "get_controller_id" '[] (IO Int)
         where
        nodeMethod = Godot.Core.ARVRController.get_controller_id

{-# NOINLINE bindARVRController_get_controller_name #-}

bindARVRController_get_controller_name :: MethodBind
bindARVRController_get_controller_name
  = unsafePerformIO $
      withCString "ARVRController" $
        \ clsNamePtr ->
          withCString "get_controller_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_controller_name ::
                      (ARVRController :< cls, Object :< cls) => cls -> IO GodotString
get_controller_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRController_get_controller_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRController "get_controller_name" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.ARVRController.get_controller_name

{-# NOINLINE bindARVRController_get_hand #-}

bindARVRController_get_hand :: MethodBind
bindARVRController_get_hand
  = unsafePerformIO $
      withCString "ARVRController" $
        \ clsNamePtr ->
          withCString "get_hand" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_hand :: (ARVRController :< cls, Object :< cls) => cls -> IO Int
get_hand cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRController_get_hand (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRController "get_hand" '[] (IO Int) where
        nodeMethod = Godot.Core.ARVRController.get_hand

{-# NOINLINE bindARVRController_get_is_active #-}

bindARVRController_get_is_active :: MethodBind
bindARVRController_get_is_active
  = unsafePerformIO $
      withCString "ARVRController" $
        \ clsNamePtr ->
          withCString "get_is_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_is_active ::
                (ARVRController :< cls, Object :< cls) => cls -> IO Bool
get_is_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRController_get_is_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRController "get_is_active" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.ARVRController.get_is_active

{-# NOINLINE bindARVRController_get_joystick_axis #-}

bindARVRController_get_joystick_axis :: MethodBind
bindARVRController_get_joystick_axis
  = unsafePerformIO $
      withCString "ARVRController" $
        \ clsNamePtr ->
          withCString "get_joystick_axis" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_joystick_axis ::
                    (ARVRController :< cls, Object :< cls) => cls -> Int -> IO Float
get_joystick_axis cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRController_get_joystick_axis
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRController "get_joystick_axis" '[Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.ARVRController.get_joystick_axis

{-# NOINLINE bindARVRController_get_joystick_id #-}

bindARVRController_get_joystick_id :: MethodBind
bindARVRController_get_joystick_id
  = unsafePerformIO $
      withCString "ARVRController" $
        \ clsNamePtr ->
          withCString "get_joystick_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_joystick_id ::
                  (ARVRController :< cls, Object :< cls) => cls -> IO Int
get_joystick_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRController_get_joystick_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRController "get_joystick_id" '[] (IO Int)
         where
        nodeMethod = Godot.Core.ARVRController.get_joystick_id

{-# NOINLINE bindARVRController_get_mesh #-}

bindARVRController_get_mesh :: MethodBind
bindARVRController_get_mesh
  = unsafePerformIO $
      withCString "ARVRController" $
        \ clsNamePtr ->
          withCString "get_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_mesh ::
           (ARVRController :< cls, Object :< cls) => cls -> IO Mesh
get_mesh cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRController_get_mesh (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRController "get_mesh" '[] (IO Mesh) where
        nodeMethod = Godot.Core.ARVRController.get_mesh

{-# NOINLINE bindARVRController_get_rumble #-}

bindARVRController_get_rumble :: MethodBind
bindARVRController_get_rumble
  = unsafePerformIO $
      withCString "ARVRController" $
        \ clsNamePtr ->
          withCString "get_rumble" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_rumble ::
             (ARVRController :< cls, Object :< cls) => cls -> IO Float
get_rumble cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRController_get_rumble (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRController "get_rumble" '[] (IO Float)
         where
        nodeMethod = Godot.Core.ARVRController.get_rumble

{-# NOINLINE bindARVRController_is_button_pressed #-}

bindARVRController_is_button_pressed :: MethodBind
bindARVRController_is_button_pressed
  = unsafePerformIO $
      withCString "ARVRController" $
        \ clsNamePtr ->
          withCString "is_button_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_button_pressed ::
                    (ARVRController :< cls, Object :< cls) => cls -> Int -> IO Int
is_button_pressed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRController_is_button_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRController "is_button_pressed" '[Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.ARVRController.is_button_pressed

{-# NOINLINE bindARVRController_set_controller_id #-}

bindARVRController_set_controller_id :: MethodBind
bindARVRController_set_controller_id
  = unsafePerformIO $
      withCString "ARVRController" $
        \ clsNamePtr ->
          withCString "set_controller_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_controller_id ::
                    (ARVRController :< cls, Object :< cls) => cls -> Int -> IO ()
set_controller_id cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRController_set_controller_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRController "set_controller_id" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.ARVRController.set_controller_id

{-# NOINLINE bindARVRController_set_rumble #-}

bindARVRController_set_rumble :: MethodBind
bindARVRController_set_rumble
  = unsafePerformIO $
      withCString "ARVRController" $
        \ clsNamePtr ->
          withCString "set_rumble" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_rumble ::
             (ARVRController :< cls, Object :< cls) => cls -> Float -> IO ()
set_rumble cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRController_set_rumble (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRController "set_rumble" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.ARVRController.set_rumble