{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VehicleBody
       (Godot.Core.VehicleBody.get_brake,
        Godot.Core.VehicleBody.get_engine_force,
        Godot.Core.VehicleBody.get_steering,
        Godot.Core.VehicleBody.set_brake,
        Godot.Core.VehicleBody.set_engine_force,
        Godot.Core.VehicleBody.set_steering)
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
import Godot.Core.RigidBody()

instance NodeProperty VehicleBody "brake" Float 'False where
        nodeProperty = (get_brake, wrapDroppingSetter set_brake, Nothing)

instance NodeProperty VehicleBody "engine_force" Float 'False where
        nodeProperty
          = (get_engine_force, wrapDroppingSetter set_engine_force, Nothing)

instance NodeProperty VehicleBody "steering" Float 'False where
        nodeProperty
          = (get_steering, wrapDroppingSetter set_steering, Nothing)

{-# NOINLINE bindVehicleBody_get_brake #-}

bindVehicleBody_get_brake :: MethodBind
bindVehicleBody_get_brake
  = unsafePerformIO $
      withCString "VehicleBody" $
        \ clsNamePtr ->
          withCString "get_brake" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_brake :: (VehicleBody :< cls, Object :< cls) => cls -> IO Float
get_brake cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleBody_get_brake (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VehicleBody "get_brake" '[] (IO Float) where
        nodeMethod = Godot.Core.VehicleBody.get_brake

{-# NOINLINE bindVehicleBody_get_engine_force #-}

bindVehicleBody_get_engine_force :: MethodBind
bindVehicleBody_get_engine_force
  = unsafePerformIO $
      withCString "VehicleBody" $
        \ clsNamePtr ->
          withCString "get_engine_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_engine_force ::
                   (VehicleBody :< cls, Object :< cls) => cls -> IO Float
get_engine_force cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleBody_get_engine_force
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VehicleBody "get_engine_force" '[] (IO Float)
         where
        nodeMethod = Godot.Core.VehicleBody.get_engine_force

{-# NOINLINE bindVehicleBody_get_steering #-}

bindVehicleBody_get_steering :: MethodBind
bindVehicleBody_get_steering
  = unsafePerformIO $
      withCString "VehicleBody" $
        \ clsNamePtr ->
          withCString "get_steering" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_steering ::
               (VehicleBody :< cls, Object :< cls) => cls -> IO Float
get_steering cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleBody_get_steering (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VehicleBody "get_steering" '[] (IO Float) where
        nodeMethod = Godot.Core.VehicleBody.get_steering

{-# NOINLINE bindVehicleBody_set_brake #-}

bindVehicleBody_set_brake :: MethodBind
bindVehicleBody_set_brake
  = unsafePerformIO $
      withCString "VehicleBody" $
        \ clsNamePtr ->
          withCString "set_brake" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_brake ::
            (VehicleBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_brake cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleBody_set_brake (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VehicleBody "set_brake" '[Float] (IO ()) where
        nodeMethod = Godot.Core.VehicleBody.set_brake

{-# NOINLINE bindVehicleBody_set_engine_force #-}

bindVehicleBody_set_engine_force :: MethodBind
bindVehicleBody_set_engine_force
  = unsafePerformIO $
      withCString "VehicleBody" $
        \ clsNamePtr ->
          withCString "set_engine_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_engine_force ::
                   (VehicleBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_engine_force cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleBody_set_engine_force
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VehicleBody "set_engine_force" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.VehicleBody.set_engine_force

{-# NOINLINE bindVehicleBody_set_steering #-}

bindVehicleBody_set_steering :: MethodBind
bindVehicleBody_set_steering
  = unsafePerformIO $
      withCString "VehicleBody" $
        \ clsNamePtr ->
          withCString "set_steering" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_steering ::
               (VehicleBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_steering cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleBody_set_steering (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VehicleBody "set_steering" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.VehicleBody.set_steering