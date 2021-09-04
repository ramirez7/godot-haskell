{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.PhysicsDirectBodyState
       (Godot.Core.PhysicsDirectBodyState.add_central_force,
        Godot.Core.PhysicsDirectBodyState.add_force,
        Godot.Core.PhysicsDirectBodyState.add_torque,
        Godot.Core.PhysicsDirectBodyState.apply_central_impulse,
        Godot.Core.PhysicsDirectBodyState.apply_impulse,
        Godot.Core.PhysicsDirectBodyState.apply_torque_impulse,
        Godot.Core.PhysicsDirectBodyState.get_angular_velocity,
        Godot.Core.PhysicsDirectBodyState.get_center_of_mass,
        Godot.Core.PhysicsDirectBodyState.get_contact_collider,
        Godot.Core.PhysicsDirectBodyState.get_contact_collider_id,
        Godot.Core.PhysicsDirectBodyState.get_contact_collider_object,
        Godot.Core.PhysicsDirectBodyState.get_contact_collider_position,
        Godot.Core.PhysicsDirectBodyState.get_contact_collider_shape,
        Godot.Core.PhysicsDirectBodyState.get_contact_collider_velocity_at_position,
        Godot.Core.PhysicsDirectBodyState.get_contact_count,
        Godot.Core.PhysicsDirectBodyState.get_contact_impulse,
        Godot.Core.PhysicsDirectBodyState.get_contact_local_normal,
        Godot.Core.PhysicsDirectBodyState.get_contact_local_position,
        Godot.Core.PhysicsDirectBodyState.get_contact_local_shape,
        Godot.Core.PhysicsDirectBodyState.get_inverse_inertia,
        Godot.Core.PhysicsDirectBodyState.get_inverse_mass,
        Godot.Core.PhysicsDirectBodyState.get_linear_velocity,
        Godot.Core.PhysicsDirectBodyState.get_principal_inertia_axes,
        Godot.Core.PhysicsDirectBodyState.get_space_state,
        Godot.Core.PhysicsDirectBodyState.get_step,
        Godot.Core.PhysicsDirectBodyState.get_total_angular_damp,
        Godot.Core.PhysicsDirectBodyState.get_total_gravity,
        Godot.Core.PhysicsDirectBodyState.get_total_linear_damp,
        Godot.Core.PhysicsDirectBodyState.get_transform,
        Godot.Core.PhysicsDirectBodyState.integrate_forces,
        Godot.Core.PhysicsDirectBodyState.is_sleeping,
        Godot.Core.PhysicsDirectBodyState.set_angular_velocity,
        Godot.Core.PhysicsDirectBodyState.set_linear_velocity,
        Godot.Core.PhysicsDirectBodyState.set_sleep_state,
        Godot.Core.PhysicsDirectBodyState.set_transform)
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
import Godot.Core.Object()

instance NodeProperty PhysicsDirectBodyState "angular_velocity"
           Vector3
           'False
         where
        nodeProperty
          = (get_angular_velocity, wrapDroppingSetter set_angular_velocity,
             Nothing)

instance NodeProperty PhysicsDirectBodyState "center_of_mass"
           Vector3
           'True
         where
        nodeProperty = (get_center_of_mass, (), Nothing)

instance NodeProperty PhysicsDirectBodyState "inverse_inertia"
           Vector3
           'True
         where
        nodeProperty = (get_inverse_inertia, (), Nothing)

instance NodeProperty PhysicsDirectBodyState "inverse_mass" Float
           'True
         where
        nodeProperty = (get_inverse_mass, (), Nothing)

instance NodeProperty PhysicsDirectBodyState "linear_velocity"
           Vector3
           'False
         where
        nodeProperty
          = (get_linear_velocity, wrapDroppingSetter set_linear_velocity,
             Nothing)

instance NodeProperty PhysicsDirectBodyState
           "principal_inertia_axes"
           Basis
           'True
         where
        nodeProperty = (get_principal_inertia_axes, (), Nothing)

instance NodeProperty PhysicsDirectBodyState "sleeping" Bool 'False
         where
        nodeProperty
          = (is_sleeping, wrapDroppingSetter set_sleep_state, Nothing)

instance NodeProperty PhysicsDirectBodyState "step" Float 'True
         where
        nodeProperty = (get_step, (), Nothing)

instance NodeProperty PhysicsDirectBodyState "total_angular_damp"
           Float
           'True
         where
        nodeProperty = (get_total_angular_damp, (), Nothing)

instance NodeProperty PhysicsDirectBodyState "total_gravity"
           Vector3
           'True
         where
        nodeProperty = (get_total_gravity, (), Nothing)

instance NodeProperty PhysicsDirectBodyState "total_linear_damp"
           Float
           'True
         where
        nodeProperty = (get_total_linear_damp, (), Nothing)

instance NodeProperty PhysicsDirectBodyState "transform" Transform
           'False
         where
        nodeProperty
          = (get_transform, wrapDroppingSetter set_transform, Nothing)

{-# NOINLINE bindPhysicsDirectBodyState_add_central_force #-}

bindPhysicsDirectBodyState_add_central_force :: MethodBind
bindPhysicsDirectBodyState_add_central_force
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "add_central_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_central_force ::
                    (PhysicsDirectBodyState :< cls, Object :< cls) =>
                    cls -> Vector3 -> IO ()
add_central_force cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_add_central_force
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState "add_central_force"
           '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsDirectBodyState.add_central_force

{-# NOINLINE bindPhysicsDirectBodyState_add_force #-}

bindPhysicsDirectBodyState_add_force :: MethodBind
bindPhysicsDirectBodyState_add_force
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "add_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_force ::
            (PhysicsDirectBodyState :< cls, Object :< cls) =>
            cls -> Vector3 -> Vector3 -> IO ()
add_force cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_add_force
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState "add_force"
           '[Vector3, Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsDirectBodyState.add_force

{-# NOINLINE bindPhysicsDirectBodyState_add_torque #-}

bindPhysicsDirectBodyState_add_torque :: MethodBind
bindPhysicsDirectBodyState_add_torque
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "add_torque" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_torque ::
             (PhysicsDirectBodyState :< cls, Object :< cls) =>
             cls -> Vector3 -> IO ()
add_torque cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_add_torque
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState "add_torque" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsDirectBodyState.add_torque

{-# NOINLINE bindPhysicsDirectBodyState_apply_central_impulse #-}

bindPhysicsDirectBodyState_apply_central_impulse :: MethodBind
bindPhysicsDirectBodyState_apply_central_impulse
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "apply_central_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

apply_central_impulse ::
                        (PhysicsDirectBodyState :< cls, Object :< cls) =>
                        cls -> Vector3 -> IO ()
apply_central_impulse cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_apply_central_impulse
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState "apply_central_impulse"
           '[Vector3]
           (IO ())
         where
        nodeMethod
          = Godot.Core.PhysicsDirectBodyState.apply_central_impulse

{-# NOINLINE bindPhysicsDirectBodyState_apply_impulse #-}

bindPhysicsDirectBodyState_apply_impulse :: MethodBind
bindPhysicsDirectBodyState_apply_impulse
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "apply_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

apply_impulse ::
                (PhysicsDirectBodyState :< cls, Object :< cls) =>
                cls -> Vector3 -> Vector3 -> IO ()
apply_impulse cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_apply_impulse
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState "apply_impulse"
           '[Vector3, Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsDirectBodyState.apply_impulse

{-# NOINLINE bindPhysicsDirectBodyState_apply_torque_impulse #-}

bindPhysicsDirectBodyState_apply_torque_impulse :: MethodBind
bindPhysicsDirectBodyState_apply_torque_impulse
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "apply_torque_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

apply_torque_impulse ::
                       (PhysicsDirectBodyState :< cls, Object :< cls) =>
                       cls -> Vector3 -> IO ()
apply_torque_impulse cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_apply_torque_impulse
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState "apply_torque_impulse"
           '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsDirectBodyState.apply_torque_impulse

{-# NOINLINE bindPhysicsDirectBodyState_get_angular_velocity #-}

bindPhysicsDirectBodyState_get_angular_velocity :: MethodBind
bindPhysicsDirectBodyState_get_angular_velocity
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_angular_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_angular_velocity ::
                       (PhysicsDirectBodyState :< cls, Object :< cls) => cls -> IO Vector3
get_angular_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_angular_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState "get_angular_velocity"
           '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.PhysicsDirectBodyState.get_angular_velocity

{-# NOINLINE bindPhysicsDirectBodyState_get_center_of_mass #-}

bindPhysicsDirectBodyState_get_center_of_mass :: MethodBind
bindPhysicsDirectBodyState_get_center_of_mass
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_center_of_mass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_center_of_mass ::
                     (PhysicsDirectBodyState :< cls, Object :< cls) => cls -> IO Vector3
get_center_of_mass cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_center_of_mass
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState "get_center_of_mass" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.PhysicsDirectBodyState.get_center_of_mass

{-# NOINLINE bindPhysicsDirectBodyState_get_contact_collider #-}

bindPhysicsDirectBodyState_get_contact_collider :: MethodBind
bindPhysicsDirectBodyState_get_contact_collider
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_collider" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_contact_collider ::
                       (PhysicsDirectBodyState :< cls, Object :< cls) =>
                       cls -> Int -> IO Rid
get_contact_collider cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_contact_collider
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState "get_contact_collider"
           '[Int]
           (IO Rid)
         where
        nodeMethod = Godot.Core.PhysicsDirectBodyState.get_contact_collider

{-# NOINLINE bindPhysicsDirectBodyState_get_contact_collider_id #-}

bindPhysicsDirectBodyState_get_contact_collider_id :: MethodBind
bindPhysicsDirectBodyState_get_contact_collider_id
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_collider_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_contact_collider_id ::
                          (PhysicsDirectBodyState :< cls, Object :< cls) =>
                          cls -> Int -> IO Int
get_contact_collider_id cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_contact_collider_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState
           "get_contact_collider_id"
           '[Int]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.PhysicsDirectBodyState.get_contact_collider_id

{-# NOINLINE bindPhysicsDirectBodyState_get_contact_collider_object
             #-}

bindPhysicsDirectBodyState_get_contact_collider_object ::
                                                       MethodBind
bindPhysicsDirectBodyState_get_contact_collider_object
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_collider_object" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_contact_collider_object ::
                              (PhysicsDirectBodyState :< cls, Object :< cls) =>
                              cls -> Int -> IO Object
get_contact_collider_object cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_contact_collider_object
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState
           "get_contact_collider_object"
           '[Int]
           (IO Object)
         where
        nodeMethod
          = Godot.Core.PhysicsDirectBodyState.get_contact_collider_object

{-# NOINLINE bindPhysicsDirectBodyState_get_contact_collider_position
             #-}

bindPhysicsDirectBodyState_get_contact_collider_position ::
                                                         MethodBind
bindPhysicsDirectBodyState_get_contact_collider_position
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_collider_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_contact_collider_position ::
                                (PhysicsDirectBodyState :< cls, Object :< cls) =>
                                cls -> Int -> IO Vector3
get_contact_collider_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_contact_collider_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState
           "get_contact_collider_position"
           '[Int]
           (IO Vector3)
         where
        nodeMethod
          = Godot.Core.PhysicsDirectBodyState.get_contact_collider_position

{-# NOINLINE bindPhysicsDirectBodyState_get_contact_collider_shape
             #-}

bindPhysicsDirectBodyState_get_contact_collider_shape :: MethodBind
bindPhysicsDirectBodyState_get_contact_collider_shape
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_collider_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_contact_collider_shape ::
                             (PhysicsDirectBodyState :< cls, Object :< cls) =>
                             cls -> Int -> IO Int
get_contact_collider_shape cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_contact_collider_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState
           "get_contact_collider_shape"
           '[Int]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.PhysicsDirectBodyState.get_contact_collider_shape

{-# NOINLINE bindPhysicsDirectBodyState_get_contact_collider_velocity_at_position
             #-}

bindPhysicsDirectBodyState_get_contact_collider_velocity_at_position ::
                                                                     MethodBind
bindPhysicsDirectBodyState_get_contact_collider_velocity_at_position
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_collider_velocity_at_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_contact_collider_velocity_at_position ::
                                            (PhysicsDirectBodyState :< cls, Object :< cls) =>
                                            cls -> Int -> IO Vector3
get_contact_collider_velocity_at_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_contact_collider_velocity_at_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState
           "get_contact_collider_velocity_at_position"
           '[Int]
           (IO Vector3)
         where
        nodeMethod
          = Godot.Core.PhysicsDirectBodyState.get_contact_collider_velocity_at_position

{-# NOINLINE bindPhysicsDirectBodyState_get_contact_count #-}

bindPhysicsDirectBodyState_get_contact_count :: MethodBind
bindPhysicsDirectBodyState_get_contact_count
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_contact_count ::
                    (PhysicsDirectBodyState :< cls, Object :< cls) => cls -> IO Int
get_contact_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_get_contact_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState "get_contact_count" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.PhysicsDirectBodyState.get_contact_count

{-# NOINLINE bindPhysicsDirectBodyState_get_contact_impulse #-}

bindPhysicsDirectBodyState_get_contact_impulse :: MethodBind
bindPhysicsDirectBodyState_get_contact_impulse
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_contact_impulse ::
                      (PhysicsDirectBodyState :< cls, Object :< cls) =>
                      cls -> Int -> IO Float
get_contact_impulse cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_contact_impulse
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState "get_contact_impulse"
           '[Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.PhysicsDirectBodyState.get_contact_impulse

{-# NOINLINE bindPhysicsDirectBodyState_get_contact_local_normal
             #-}

bindPhysicsDirectBodyState_get_contact_local_normal :: MethodBind
bindPhysicsDirectBodyState_get_contact_local_normal
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_local_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_contact_local_normal ::
                           (PhysicsDirectBodyState :< cls, Object :< cls) =>
                           cls -> Int -> IO Vector3
get_contact_local_normal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_contact_local_normal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState
           "get_contact_local_normal"
           '[Int]
           (IO Vector3)
         where
        nodeMethod
          = Godot.Core.PhysicsDirectBodyState.get_contact_local_normal

{-# NOINLINE bindPhysicsDirectBodyState_get_contact_local_position
             #-}

bindPhysicsDirectBodyState_get_contact_local_position :: MethodBind
bindPhysicsDirectBodyState_get_contact_local_position
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_local_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_contact_local_position ::
                             (PhysicsDirectBodyState :< cls, Object :< cls) =>
                             cls -> Int -> IO Vector3
get_contact_local_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_contact_local_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState
           "get_contact_local_position"
           '[Int]
           (IO Vector3)
         where
        nodeMethod
          = Godot.Core.PhysicsDirectBodyState.get_contact_local_position

{-# NOINLINE bindPhysicsDirectBodyState_get_contact_local_shape #-}

bindPhysicsDirectBodyState_get_contact_local_shape :: MethodBind
bindPhysicsDirectBodyState_get_contact_local_shape
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_local_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_contact_local_shape ::
                          (PhysicsDirectBodyState :< cls, Object :< cls) =>
                          cls -> Int -> IO Int
get_contact_local_shape cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_contact_local_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState
           "get_contact_local_shape"
           '[Int]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.PhysicsDirectBodyState.get_contact_local_shape

{-# NOINLINE bindPhysicsDirectBodyState_get_inverse_inertia #-}

bindPhysicsDirectBodyState_get_inverse_inertia :: MethodBind
bindPhysicsDirectBodyState_get_inverse_inertia
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_inverse_inertia" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_inverse_inertia ::
                      (PhysicsDirectBodyState :< cls, Object :< cls) => cls -> IO Vector3
get_inverse_inertia cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_inverse_inertia
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState "get_inverse_inertia"
           '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.PhysicsDirectBodyState.get_inverse_inertia

{-# NOINLINE bindPhysicsDirectBodyState_get_inverse_mass #-}

bindPhysicsDirectBodyState_get_inverse_mass :: MethodBind
bindPhysicsDirectBodyState_get_inverse_mass
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_inverse_mass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_inverse_mass ::
                   (PhysicsDirectBodyState :< cls, Object :< cls) => cls -> IO Float
get_inverse_mass cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_get_inverse_mass
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState "get_inverse_mass" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.PhysicsDirectBodyState.get_inverse_mass

{-# NOINLINE bindPhysicsDirectBodyState_get_linear_velocity #-}

bindPhysicsDirectBodyState_get_linear_velocity :: MethodBind
bindPhysicsDirectBodyState_get_linear_velocity
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_linear_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_linear_velocity ::
                      (PhysicsDirectBodyState :< cls, Object :< cls) => cls -> IO Vector3
get_linear_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_linear_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState "get_linear_velocity"
           '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.PhysicsDirectBodyState.get_linear_velocity

{-# NOINLINE bindPhysicsDirectBodyState_get_principal_inertia_axes
             #-}

bindPhysicsDirectBodyState_get_principal_inertia_axes :: MethodBind
bindPhysicsDirectBodyState_get_principal_inertia_axes
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_principal_inertia_axes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_principal_inertia_axes ::
                             (PhysicsDirectBodyState :< cls, Object :< cls) => cls -> IO Basis
get_principal_inertia_axes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_principal_inertia_axes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState
           "get_principal_inertia_axes"
           '[]
           (IO Basis)
         where
        nodeMethod
          = Godot.Core.PhysicsDirectBodyState.get_principal_inertia_axes

{-# NOINLINE bindPhysicsDirectBodyState_get_space_state #-}

bindPhysicsDirectBodyState_get_space_state :: MethodBind
bindPhysicsDirectBodyState_get_space_state
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_space_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_space_state ::
                  (PhysicsDirectBodyState :< cls, Object :< cls) =>
                  cls -> IO PhysicsDirectSpaceState
get_space_state cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_get_space_state
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState "get_space_state" '[]
           (IO PhysicsDirectSpaceState)
         where
        nodeMethod = Godot.Core.PhysicsDirectBodyState.get_space_state

{-# NOINLINE bindPhysicsDirectBodyState_get_step #-}

bindPhysicsDirectBodyState_get_step :: MethodBind
bindPhysicsDirectBodyState_get_step
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_step" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_step ::
           (PhysicsDirectBodyState :< cls, Object :< cls) => cls -> IO Float
get_step cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_get_step
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState "get_step" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.PhysicsDirectBodyState.get_step

{-# NOINLINE bindPhysicsDirectBodyState_get_total_angular_damp #-}

bindPhysicsDirectBodyState_get_total_angular_damp :: MethodBind
bindPhysicsDirectBodyState_get_total_angular_damp
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_total_angular_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_total_angular_damp ::
                         (PhysicsDirectBodyState :< cls, Object :< cls) => cls -> IO Float
get_total_angular_damp cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_total_angular_damp
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState "get_total_angular_damp"
           '[]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.PhysicsDirectBodyState.get_total_angular_damp

{-# NOINLINE bindPhysicsDirectBodyState_get_total_gravity #-}

bindPhysicsDirectBodyState_get_total_gravity :: MethodBind
bindPhysicsDirectBodyState_get_total_gravity
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_total_gravity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_total_gravity ::
                    (PhysicsDirectBodyState :< cls, Object :< cls) => cls -> IO Vector3
get_total_gravity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_get_total_gravity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState "get_total_gravity" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.PhysicsDirectBodyState.get_total_gravity

{-# NOINLINE bindPhysicsDirectBodyState_get_total_linear_damp #-}

bindPhysicsDirectBodyState_get_total_linear_damp :: MethodBind
bindPhysicsDirectBodyState_get_total_linear_damp
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_total_linear_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_total_linear_damp ::
                        (PhysicsDirectBodyState :< cls, Object :< cls) => cls -> IO Float
get_total_linear_damp cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_total_linear_damp
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState "get_total_linear_damp"
           '[]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.PhysicsDirectBodyState.get_total_linear_damp

{-# NOINLINE bindPhysicsDirectBodyState_get_transform #-}

bindPhysicsDirectBodyState_get_transform :: MethodBind
bindPhysicsDirectBodyState_get_transform
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_transform ::
                (PhysicsDirectBodyState :< cls, Object :< cls) =>
                cls -> IO Transform
get_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_get_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState "get_transform" '[]
           (IO Transform)
         where
        nodeMethod = Godot.Core.PhysicsDirectBodyState.get_transform

{-# NOINLINE bindPhysicsDirectBodyState_integrate_forces #-}

bindPhysicsDirectBodyState_integrate_forces :: MethodBind
bindPhysicsDirectBodyState_integrate_forces
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "integrate_forces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

integrate_forces ::
                   (PhysicsDirectBodyState :< cls, Object :< cls) => cls -> IO ()
integrate_forces cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_integrate_forces
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState "integrate_forces" '[]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsDirectBodyState.integrate_forces

{-# NOINLINE bindPhysicsDirectBodyState_is_sleeping #-}

bindPhysicsDirectBodyState_is_sleeping :: MethodBind
bindPhysicsDirectBodyState_is_sleeping
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "is_sleeping" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_sleeping ::
              (PhysicsDirectBodyState :< cls, Object :< cls) => cls -> IO Bool
is_sleeping cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_is_sleeping
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState "is_sleeping" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.PhysicsDirectBodyState.is_sleeping

{-# NOINLINE bindPhysicsDirectBodyState_set_angular_velocity #-}

bindPhysicsDirectBodyState_set_angular_velocity :: MethodBind
bindPhysicsDirectBodyState_set_angular_velocity
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "set_angular_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_angular_velocity ::
                       (PhysicsDirectBodyState :< cls, Object :< cls) =>
                       cls -> Vector3 -> IO ()
set_angular_velocity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_set_angular_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState "set_angular_velocity"
           '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsDirectBodyState.set_angular_velocity

{-# NOINLINE bindPhysicsDirectBodyState_set_linear_velocity #-}

bindPhysicsDirectBodyState_set_linear_velocity :: MethodBind
bindPhysicsDirectBodyState_set_linear_velocity
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "set_linear_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_linear_velocity ::
                      (PhysicsDirectBodyState :< cls, Object :< cls) =>
                      cls -> Vector3 -> IO ()
set_linear_velocity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_set_linear_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState "set_linear_velocity"
           '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsDirectBodyState.set_linear_velocity

{-# NOINLINE bindPhysicsDirectBodyState_set_sleep_state #-}

bindPhysicsDirectBodyState_set_sleep_state :: MethodBind
bindPhysicsDirectBodyState_set_sleep_state
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "set_sleep_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_sleep_state ::
                  (PhysicsDirectBodyState :< cls, Object :< cls) =>
                  cls -> Bool -> IO ()
set_sleep_state cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_set_sleep_state
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState "set_sleep_state"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsDirectBodyState.set_sleep_state

{-# NOINLINE bindPhysicsDirectBodyState_set_transform #-}

bindPhysicsDirectBodyState_set_transform :: MethodBind
bindPhysicsDirectBodyState_set_transform
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_transform ::
                (PhysicsDirectBodyState :< cls, Object :< cls) =>
                cls -> Transform -> IO ()
set_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_set_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectBodyState "set_transform"
           '[Transform]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsDirectBodyState.set_transform