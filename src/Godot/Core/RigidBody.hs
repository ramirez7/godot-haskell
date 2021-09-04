{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.RigidBody
       (Godot.Core.RigidBody._MODE_STATIC,
        Godot.Core.RigidBody._MODE_KINEMATIC,
        Godot.Core.RigidBody._MODE_RIGID,
        Godot.Core.RigidBody._MODE_CHARACTER,
        Godot.Core.RigidBody.sig_body_entered,
        Godot.Core.RigidBody.sig_body_exited,
        Godot.Core.RigidBody.sig_body_shape_entered,
        Godot.Core.RigidBody.sig_body_shape_exited,
        Godot.Core.RigidBody.sig_sleeping_state_changed,
        Godot.Core.RigidBody._body_enter_tree,
        Godot.Core.RigidBody._body_exit_tree,
        Godot.Core.RigidBody._direct_state_changed,
        Godot.Core.RigidBody._integrate_forces,
        Godot.Core.RigidBody._reload_physics_characteristics,
        Godot.Core.RigidBody.add_central_force,
        Godot.Core.RigidBody.add_force, Godot.Core.RigidBody.add_torque,
        Godot.Core.RigidBody.apply_central_impulse,
        Godot.Core.RigidBody.apply_impulse,
        Godot.Core.RigidBody.apply_torque_impulse,
        Godot.Core.RigidBody.get_angular_damp,
        Godot.Core.RigidBody.get_angular_velocity,
        Godot.Core.RigidBody.get_axis_lock,
        Godot.Core.RigidBody.get_bounce,
        Godot.Core.RigidBody.get_colliding_bodies,
        Godot.Core.RigidBody.get_friction,
        Godot.Core.RigidBody.get_gravity_scale,
        Godot.Core.RigidBody.get_inverse_inertia_tensor,
        Godot.Core.RigidBody.get_linear_damp,
        Godot.Core.RigidBody.get_linear_velocity,
        Godot.Core.RigidBody.get_mass,
        Godot.Core.RigidBody.get_max_contacts_reported,
        Godot.Core.RigidBody.get_mode,
        Godot.Core.RigidBody.get_physics_material_override,
        Godot.Core.RigidBody.get_weight,
        Godot.Core.RigidBody.is_able_to_sleep,
        Godot.Core.RigidBody.is_contact_monitor_enabled,
        Godot.Core.RigidBody.is_sleeping,
        Godot.Core.RigidBody.is_using_continuous_collision_detection,
        Godot.Core.RigidBody.is_using_custom_integrator,
        Godot.Core.RigidBody.set_angular_damp,
        Godot.Core.RigidBody.set_angular_velocity,
        Godot.Core.RigidBody.set_axis_lock,
        Godot.Core.RigidBody.set_axis_velocity,
        Godot.Core.RigidBody.set_bounce,
        Godot.Core.RigidBody.set_can_sleep,
        Godot.Core.RigidBody.set_contact_monitor,
        Godot.Core.RigidBody.set_friction,
        Godot.Core.RigidBody.set_gravity_scale,
        Godot.Core.RigidBody.set_linear_damp,
        Godot.Core.RigidBody.set_linear_velocity,
        Godot.Core.RigidBody.set_mass,
        Godot.Core.RigidBody.set_max_contacts_reported,
        Godot.Core.RigidBody.set_mode,
        Godot.Core.RigidBody.set_physics_material_override,
        Godot.Core.RigidBody.set_sleeping,
        Godot.Core.RigidBody.set_use_continuous_collision_detection,
        Godot.Core.RigidBody.set_use_custom_integrator,
        Godot.Core.RigidBody.set_weight)
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
import Godot.Core.PhysicsBody()

_MODE_STATIC :: Int
_MODE_STATIC = 1

_MODE_KINEMATIC :: Int
_MODE_KINEMATIC = 3

_MODE_RIGID :: Int
_MODE_RIGID = 0

_MODE_CHARACTER :: Int
_MODE_CHARACTER = 2

sig_body_entered :: Godot.Internal.Dispatch.Signal RigidBody
sig_body_entered = Godot.Internal.Dispatch.Signal "body_entered"

instance NodeSignal RigidBody "body_entered" '[Node]

sig_body_exited :: Godot.Internal.Dispatch.Signal RigidBody
sig_body_exited = Godot.Internal.Dispatch.Signal "body_exited"

instance NodeSignal RigidBody "body_exited" '[Node]

sig_body_shape_entered :: Godot.Internal.Dispatch.Signal RigidBody
sig_body_shape_entered
  = Godot.Internal.Dispatch.Signal "body_shape_entered"

instance NodeSignal RigidBody "body_shape_entered"
           '[Int, Node, Int, Int]

sig_body_shape_exited :: Godot.Internal.Dispatch.Signal RigidBody
sig_body_shape_exited
  = Godot.Internal.Dispatch.Signal "body_shape_exited"

instance NodeSignal RigidBody "body_shape_exited"
           '[Int, Node, Int, Int]

sig_sleeping_state_changed ::
                           Godot.Internal.Dispatch.Signal RigidBody
sig_sleeping_state_changed
  = Godot.Internal.Dispatch.Signal "sleeping_state_changed"

instance NodeSignal RigidBody "sleeping_state_changed" '[]

instance NodeProperty RigidBody "angular_damp" Float 'False where
        nodeProperty
          = (get_angular_damp, wrapDroppingSetter set_angular_damp, Nothing)

instance NodeProperty RigidBody "angular_velocity" Vector3 'False
         where
        nodeProperty
          = (get_angular_velocity, wrapDroppingSetter set_angular_velocity,
             Nothing)

instance NodeProperty RigidBody "axis_lock_angular_x" Bool 'False
         where
        nodeProperty
          = (wrapIndexedGetter 8 get_axis_lock,
             wrapIndexedSetter 8 set_axis_lock, Nothing)

instance NodeProperty RigidBody "axis_lock_angular_y" Bool 'False
         where
        nodeProperty
          = (wrapIndexedGetter 16 get_axis_lock,
             wrapIndexedSetter 16 set_axis_lock, Nothing)

instance NodeProperty RigidBody "axis_lock_angular_z" Bool 'False
         where
        nodeProperty
          = (wrapIndexedGetter 32 get_axis_lock,
             wrapIndexedSetter 32 set_axis_lock, Nothing)

instance NodeProperty RigidBody "axis_lock_linear_x" Bool 'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_axis_lock,
             wrapIndexedSetter 1 set_axis_lock, Nothing)

instance NodeProperty RigidBody "axis_lock_linear_y" Bool 'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_axis_lock,
             wrapIndexedSetter 2 set_axis_lock, Nothing)

instance NodeProperty RigidBody "axis_lock_linear_z" Bool 'False
         where
        nodeProperty
          = (wrapIndexedGetter 4 get_axis_lock,
             wrapIndexedSetter 4 set_axis_lock, Nothing)

instance NodeProperty RigidBody "bounce" Float 'False where
        nodeProperty = (get_bounce, wrapDroppingSetter set_bounce, Nothing)

instance NodeProperty RigidBody "can_sleep" Bool 'False where
        nodeProperty
          = (is_able_to_sleep, wrapDroppingSetter set_can_sleep, Nothing)

instance NodeProperty RigidBody "contact_monitor" Bool 'False where
        nodeProperty
          = (is_contact_monitor_enabled,
             wrapDroppingSetter set_contact_monitor, Nothing)

instance NodeProperty RigidBody "contacts_reported" Int 'False
         where
        nodeProperty
          = (get_max_contacts_reported,
             wrapDroppingSetter set_max_contacts_reported, Nothing)

instance NodeProperty RigidBody "continuous_cd" Bool 'False where
        nodeProperty
          = (is_using_continuous_collision_detection,
             wrapDroppingSetter set_use_continuous_collision_detection, Nothing)

instance NodeProperty RigidBody "custom_integrator" Bool 'False
         where
        nodeProperty
          = (is_using_custom_integrator,
             wrapDroppingSetter set_use_custom_integrator, Nothing)

instance NodeProperty RigidBody "friction" Float 'False where
        nodeProperty
          = (get_friction, wrapDroppingSetter set_friction, Nothing)

instance NodeProperty RigidBody "gravity_scale" Float 'False where
        nodeProperty
          = (get_gravity_scale, wrapDroppingSetter set_gravity_scale,
             Nothing)

instance NodeProperty RigidBody "linear_damp" Float 'False where
        nodeProperty
          = (get_linear_damp, wrapDroppingSetter set_linear_damp, Nothing)

instance NodeProperty RigidBody "linear_velocity" Vector3 'False
         where
        nodeProperty
          = (get_linear_velocity, wrapDroppingSetter set_linear_velocity,
             Nothing)

instance NodeProperty RigidBody "mass" Float 'False where
        nodeProperty = (get_mass, wrapDroppingSetter set_mass, Nothing)

instance NodeProperty RigidBody "mode" Int 'False where
        nodeProperty = (get_mode, wrapDroppingSetter set_mode, Nothing)

instance NodeProperty RigidBody "physics_material_override"
           PhysicsMaterial
           'False
         where
        nodeProperty
          = (get_physics_material_override,
             wrapDroppingSetter set_physics_material_override, Nothing)

instance NodeProperty RigidBody "sleeping" Bool 'False where
        nodeProperty
          = (is_sleeping, wrapDroppingSetter set_sleeping, Nothing)

instance NodeProperty RigidBody "weight" Float 'False where
        nodeProperty = (get_weight, wrapDroppingSetter set_weight, Nothing)

{-# NOINLINE bindRigidBody__body_enter_tree #-}

bindRigidBody__body_enter_tree :: MethodBind
bindRigidBody__body_enter_tree
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "_body_enter_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_body_enter_tree ::
                   (RigidBody :< cls, Object :< cls) => cls -> Int -> IO ()
_body_enter_tree cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody__body_enter_tree (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "_body_enter_tree" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.RigidBody._body_enter_tree

{-# NOINLINE bindRigidBody__body_exit_tree #-}

bindRigidBody__body_exit_tree :: MethodBind
bindRigidBody__body_exit_tree
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "_body_exit_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_body_exit_tree ::
                  (RigidBody :< cls, Object :< cls) => cls -> Int -> IO ()
_body_exit_tree cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody__body_exit_tree (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "_body_exit_tree" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.RigidBody._body_exit_tree

{-# NOINLINE bindRigidBody__direct_state_changed #-}

bindRigidBody__direct_state_changed :: MethodBind
bindRigidBody__direct_state_changed
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "_direct_state_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_direct_state_changed ::
                        (RigidBody :< cls, Object :< cls) => cls -> Object -> IO ()
_direct_state_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody__direct_state_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "_direct_state_changed" '[Object]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody._direct_state_changed

{-# NOINLINE bindRigidBody__integrate_forces #-}

bindRigidBody__integrate_forces :: MethodBind
bindRigidBody__integrate_forces
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "_integrate_forces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_integrate_forces ::
                    (RigidBody :< cls, Object :< cls) =>
                    cls -> PhysicsDirectBodyState -> IO ()
_integrate_forces cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody__integrate_forces (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "_integrate_forces"
           '[PhysicsDirectBodyState]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody._integrate_forces

{-# NOINLINE bindRigidBody__reload_physics_characteristics #-}

bindRigidBody__reload_physics_characteristics :: MethodBind
bindRigidBody__reload_physics_characteristics
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "_reload_physics_characteristics" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_reload_physics_characteristics ::
                                  (RigidBody :< cls, Object :< cls) => cls -> IO ()
_reload_physics_characteristics cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindRigidBody__reload_physics_characteristics
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "_reload_physics_characteristics" '[]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody._reload_physics_characteristics

{-# NOINLINE bindRigidBody_add_central_force #-}

bindRigidBody_add_central_force :: MethodBind
bindRigidBody_add_central_force
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "add_central_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_central_force ::
                    (RigidBody :< cls, Object :< cls) => cls -> Vector3 -> IO ()
add_central_force cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_add_central_force (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "add_central_force" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.add_central_force

{-# NOINLINE bindRigidBody_add_force #-}

bindRigidBody_add_force :: MethodBind
bindRigidBody_add_force
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "add_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_force ::
            (RigidBody :< cls, Object :< cls) =>
            cls -> Vector3 -> Vector3 -> IO ()
add_force cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_add_force (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "add_force" '[Vector3, Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.add_force

{-# NOINLINE bindRigidBody_add_torque #-}

bindRigidBody_add_torque :: MethodBind
bindRigidBody_add_torque
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "add_torque" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_torque ::
             (RigidBody :< cls, Object :< cls) => cls -> Vector3 -> IO ()
add_torque cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_add_torque (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "add_torque" '[Vector3] (IO ()) where
        nodeMethod = Godot.Core.RigidBody.add_torque

{-# NOINLINE bindRigidBody_apply_central_impulse #-}

bindRigidBody_apply_central_impulse :: MethodBind
bindRigidBody_apply_central_impulse
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "apply_central_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

apply_central_impulse ::
                        (RigidBody :< cls, Object :< cls) => cls -> Vector3 -> IO ()
apply_central_impulse cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_apply_central_impulse
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "apply_central_impulse" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.apply_central_impulse

{-# NOINLINE bindRigidBody_apply_impulse #-}

bindRigidBody_apply_impulse :: MethodBind
bindRigidBody_apply_impulse
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "apply_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

apply_impulse ::
                (RigidBody :< cls, Object :< cls) =>
                cls -> Vector3 -> Vector3 -> IO ()
apply_impulse cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_apply_impulse (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "apply_impulse" '[Vector3, Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.apply_impulse

{-# NOINLINE bindRigidBody_apply_torque_impulse #-}

bindRigidBody_apply_torque_impulse :: MethodBind
bindRigidBody_apply_torque_impulse
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "apply_torque_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

apply_torque_impulse ::
                       (RigidBody :< cls, Object :< cls) => cls -> Vector3 -> IO ()
apply_torque_impulse cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_apply_torque_impulse
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "apply_torque_impulse" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.apply_torque_impulse

{-# NOINLINE bindRigidBody_get_angular_damp #-}

bindRigidBody_get_angular_damp :: MethodBind
bindRigidBody_get_angular_damp
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_angular_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_angular_damp ::
                   (RigidBody :< cls, Object :< cls) => cls -> IO Float
get_angular_damp cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_angular_damp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "get_angular_damp" '[] (IO Float)
         where
        nodeMethod = Godot.Core.RigidBody.get_angular_damp

{-# NOINLINE bindRigidBody_get_angular_velocity #-}

bindRigidBody_get_angular_velocity :: MethodBind
bindRigidBody_get_angular_velocity
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_angular_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_angular_velocity ::
                       (RigidBody :< cls, Object :< cls) => cls -> IO Vector3
get_angular_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_angular_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "get_angular_velocity" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.RigidBody.get_angular_velocity

{-# NOINLINE bindRigidBody_get_axis_lock #-}

bindRigidBody_get_axis_lock :: MethodBind
bindRigidBody_get_axis_lock
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_axis_lock" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_axis_lock ::
                (RigidBody :< cls, Object :< cls) => cls -> Int -> IO Bool
get_axis_lock cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_axis_lock (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "get_axis_lock" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.RigidBody.get_axis_lock

{-# NOINLINE bindRigidBody_get_bounce #-}

bindRigidBody_get_bounce :: MethodBind
bindRigidBody_get_bounce
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_bounce :: (RigidBody :< cls, Object :< cls) => cls -> IO Float
get_bounce cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_bounce (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "get_bounce" '[] (IO Float) where
        nodeMethod = Godot.Core.RigidBody.get_bounce

{-# NOINLINE bindRigidBody_get_colliding_bodies #-}

bindRigidBody_get_colliding_bodies :: MethodBind
bindRigidBody_get_colliding_bodies
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_colliding_bodies" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_colliding_bodies ::
                       (RigidBody :< cls, Object :< cls) => cls -> IO Array
get_colliding_bodies cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_colliding_bodies
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "get_colliding_bodies" '[] (IO Array)
         where
        nodeMethod = Godot.Core.RigidBody.get_colliding_bodies

{-# NOINLINE bindRigidBody_get_friction #-}

bindRigidBody_get_friction :: MethodBind
bindRigidBody_get_friction
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_friction ::
               (RigidBody :< cls, Object :< cls) => cls -> IO Float
get_friction cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_friction (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "get_friction" '[] (IO Float) where
        nodeMethod = Godot.Core.RigidBody.get_friction

{-# NOINLINE bindRigidBody_get_gravity_scale #-}

bindRigidBody_get_gravity_scale :: MethodBind
bindRigidBody_get_gravity_scale
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_gravity_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_gravity_scale ::
                    (RigidBody :< cls, Object :< cls) => cls -> IO Float
get_gravity_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_gravity_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "get_gravity_scale" '[] (IO Float)
         where
        nodeMethod = Godot.Core.RigidBody.get_gravity_scale

{-# NOINLINE bindRigidBody_get_inverse_inertia_tensor #-}

bindRigidBody_get_inverse_inertia_tensor :: MethodBind
bindRigidBody_get_inverse_inertia_tensor
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_inverse_inertia_tensor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_inverse_inertia_tensor ::
                             (RigidBody :< cls, Object :< cls) => cls -> IO Basis
get_inverse_inertia_tensor cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_inverse_inertia_tensor
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "get_inverse_inertia_tensor" '[]
           (IO Basis)
         where
        nodeMethod = Godot.Core.RigidBody.get_inverse_inertia_tensor

{-# NOINLINE bindRigidBody_get_linear_damp #-}

bindRigidBody_get_linear_damp :: MethodBind
bindRigidBody_get_linear_damp
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_linear_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_linear_damp ::
                  (RigidBody :< cls, Object :< cls) => cls -> IO Float
get_linear_damp cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_linear_damp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "get_linear_damp" '[] (IO Float)
         where
        nodeMethod = Godot.Core.RigidBody.get_linear_damp

{-# NOINLINE bindRigidBody_get_linear_velocity #-}

bindRigidBody_get_linear_velocity :: MethodBind
bindRigidBody_get_linear_velocity
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_linear_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_linear_velocity ::
                      (RigidBody :< cls, Object :< cls) => cls -> IO Vector3
get_linear_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_linear_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "get_linear_velocity" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.RigidBody.get_linear_velocity

{-# NOINLINE bindRigidBody_get_mass #-}

bindRigidBody_get_mass :: MethodBind
bindRigidBody_get_mass
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_mass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_mass :: (RigidBody :< cls, Object :< cls) => cls -> IO Float
get_mass cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_mass (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "get_mass" '[] (IO Float) where
        nodeMethod = Godot.Core.RigidBody.get_mass

{-# NOINLINE bindRigidBody_get_max_contacts_reported #-}

bindRigidBody_get_max_contacts_reported :: MethodBind
bindRigidBody_get_max_contacts_reported
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_max_contacts_reported" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_max_contacts_reported ::
                            (RigidBody :< cls, Object :< cls) => cls -> IO Int
get_max_contacts_reported cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_max_contacts_reported
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "get_max_contacts_reported" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.RigidBody.get_max_contacts_reported

{-# NOINLINE bindRigidBody_get_mode #-}

bindRigidBody_get_mode :: MethodBind
bindRigidBody_get_mode
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_mode :: (RigidBody :< cls, Object :< cls) => cls -> IO Int
get_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_mode (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "get_mode" '[] (IO Int) where
        nodeMethod = Godot.Core.RigidBody.get_mode

{-# NOINLINE bindRigidBody_get_physics_material_override #-}

bindRigidBody_get_physics_material_override :: MethodBind
bindRigidBody_get_physics_material_override
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_physics_material_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_physics_material_override ::
                                (RigidBody :< cls, Object :< cls) => cls -> IO PhysicsMaterial
get_physics_material_override cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_physics_material_override
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "get_physics_material_override" '[]
           (IO PhysicsMaterial)
         where
        nodeMethod = Godot.Core.RigidBody.get_physics_material_override

{-# NOINLINE bindRigidBody_get_weight #-}

bindRigidBody_get_weight :: MethodBind
bindRigidBody_get_weight
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_weight" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_weight :: (RigidBody :< cls, Object :< cls) => cls -> IO Float
get_weight cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_weight (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "get_weight" '[] (IO Float) where
        nodeMethod = Godot.Core.RigidBody.get_weight

{-# NOINLINE bindRigidBody_is_able_to_sleep #-}

bindRigidBody_is_able_to_sleep :: MethodBind
bindRigidBody_is_able_to_sleep
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "is_able_to_sleep" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_able_to_sleep ::
                   (RigidBody :< cls, Object :< cls) => cls -> IO Bool
is_able_to_sleep cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_is_able_to_sleep (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "is_able_to_sleep" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.RigidBody.is_able_to_sleep

{-# NOINLINE bindRigidBody_is_contact_monitor_enabled #-}

bindRigidBody_is_contact_monitor_enabled :: MethodBind
bindRigidBody_is_contact_monitor_enabled
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "is_contact_monitor_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_contact_monitor_enabled ::
                             (RigidBody :< cls, Object :< cls) => cls -> IO Bool
is_contact_monitor_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_is_contact_monitor_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "is_contact_monitor_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.RigidBody.is_contact_monitor_enabled

{-# NOINLINE bindRigidBody_is_sleeping #-}

bindRigidBody_is_sleeping :: MethodBind
bindRigidBody_is_sleeping
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "is_sleeping" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_sleeping :: (RigidBody :< cls, Object :< cls) => cls -> IO Bool
is_sleeping cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_is_sleeping (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "is_sleeping" '[] (IO Bool) where
        nodeMethod = Godot.Core.RigidBody.is_sleeping

{-# NOINLINE bindRigidBody_is_using_continuous_collision_detection
             #-}

bindRigidBody_is_using_continuous_collision_detection :: MethodBind
bindRigidBody_is_using_continuous_collision_detection
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "is_using_continuous_collision_detection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_using_continuous_collision_detection ::
                                          (RigidBody :< cls, Object :< cls) => cls -> IO Bool
is_using_continuous_collision_detection cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindRigidBody_is_using_continuous_collision_detection
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody
           "is_using_continuous_collision_detection"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.RigidBody.is_using_continuous_collision_detection

{-# NOINLINE bindRigidBody_is_using_custom_integrator #-}

bindRigidBody_is_using_custom_integrator :: MethodBind
bindRigidBody_is_using_custom_integrator
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "is_using_custom_integrator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_using_custom_integrator ::
                             (RigidBody :< cls, Object :< cls) => cls -> IO Bool
is_using_custom_integrator cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_is_using_custom_integrator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "is_using_custom_integrator" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.RigidBody.is_using_custom_integrator

{-# NOINLINE bindRigidBody_set_angular_damp #-}

bindRigidBody_set_angular_damp :: MethodBind
bindRigidBody_set_angular_damp
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_angular_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_angular_damp ::
                   (RigidBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_angular_damp cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_angular_damp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "set_angular_damp" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.set_angular_damp

{-# NOINLINE bindRigidBody_set_angular_velocity #-}

bindRigidBody_set_angular_velocity :: MethodBind
bindRigidBody_set_angular_velocity
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_angular_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_angular_velocity ::
                       (RigidBody :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_angular_velocity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_angular_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "set_angular_velocity" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.set_angular_velocity

{-# NOINLINE bindRigidBody_set_axis_lock #-}

bindRigidBody_set_axis_lock :: MethodBind
bindRigidBody_set_axis_lock
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_axis_lock" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_axis_lock ::
                (RigidBody :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_axis_lock cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_axis_lock (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "set_axis_lock" '[Int, Bool] (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.set_axis_lock

{-# NOINLINE bindRigidBody_set_axis_velocity #-}

bindRigidBody_set_axis_velocity :: MethodBind
bindRigidBody_set_axis_velocity
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_axis_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_axis_velocity ::
                    (RigidBody :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_axis_velocity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_axis_velocity (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "set_axis_velocity" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.set_axis_velocity

{-# NOINLINE bindRigidBody_set_bounce #-}

bindRigidBody_set_bounce :: MethodBind
bindRigidBody_set_bounce
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_bounce ::
             (RigidBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_bounce cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_bounce (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "set_bounce" '[Float] (IO ()) where
        nodeMethod = Godot.Core.RigidBody.set_bounce

{-# NOINLINE bindRigidBody_set_can_sleep #-}

bindRigidBody_set_can_sleep :: MethodBind
bindRigidBody_set_can_sleep
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_can_sleep" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_can_sleep ::
                (RigidBody :< cls, Object :< cls) => cls -> Bool -> IO ()
set_can_sleep cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_can_sleep (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "set_can_sleep" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.RigidBody.set_can_sleep

{-# NOINLINE bindRigidBody_set_contact_monitor #-}

bindRigidBody_set_contact_monitor :: MethodBind
bindRigidBody_set_contact_monitor
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_contact_monitor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_contact_monitor ::
                      (RigidBody :< cls, Object :< cls) => cls -> Bool -> IO ()
set_contact_monitor cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_contact_monitor
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "set_contact_monitor" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.set_contact_monitor

{-# NOINLINE bindRigidBody_set_friction #-}

bindRigidBody_set_friction :: MethodBind
bindRigidBody_set_friction
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_friction ::
               (RigidBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_friction cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_friction (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "set_friction" '[Float] (IO ()) where
        nodeMethod = Godot.Core.RigidBody.set_friction

{-# NOINLINE bindRigidBody_set_gravity_scale #-}

bindRigidBody_set_gravity_scale :: MethodBind
bindRigidBody_set_gravity_scale
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_gravity_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_gravity_scale ::
                    (RigidBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_gravity_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_gravity_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "set_gravity_scale" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.set_gravity_scale

{-# NOINLINE bindRigidBody_set_linear_damp #-}

bindRigidBody_set_linear_damp :: MethodBind
bindRigidBody_set_linear_damp
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_linear_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_linear_damp ::
                  (RigidBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_linear_damp cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_linear_damp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "set_linear_damp" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.set_linear_damp

{-# NOINLINE bindRigidBody_set_linear_velocity #-}

bindRigidBody_set_linear_velocity :: MethodBind
bindRigidBody_set_linear_velocity
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_linear_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_linear_velocity ::
                      (RigidBody :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_linear_velocity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_linear_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "set_linear_velocity" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.set_linear_velocity

{-# NOINLINE bindRigidBody_set_mass #-}

bindRigidBody_set_mass :: MethodBind
bindRigidBody_set_mass
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_mass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_mass ::
           (RigidBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_mass cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_mass (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "set_mass" '[Float] (IO ()) where
        nodeMethod = Godot.Core.RigidBody.set_mass

{-# NOINLINE bindRigidBody_set_max_contacts_reported #-}

bindRigidBody_set_max_contacts_reported :: MethodBind
bindRigidBody_set_max_contacts_reported
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_max_contacts_reported" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_max_contacts_reported ::
                            (RigidBody :< cls, Object :< cls) => cls -> Int -> IO ()
set_max_contacts_reported cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_max_contacts_reported
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "set_max_contacts_reported" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.set_max_contacts_reported

{-# NOINLINE bindRigidBody_set_mode #-}

bindRigidBody_set_mode :: MethodBind
bindRigidBody_set_mode
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_mode ::
           (RigidBody :< cls, Object :< cls) => cls -> Int -> IO ()
set_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_mode (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "set_mode" '[Int] (IO ()) where
        nodeMethod = Godot.Core.RigidBody.set_mode

{-# NOINLINE bindRigidBody_set_physics_material_override #-}

bindRigidBody_set_physics_material_override :: MethodBind
bindRigidBody_set_physics_material_override
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_physics_material_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_physics_material_override ::
                                (RigidBody :< cls, Object :< cls) =>
                                cls -> PhysicsMaterial -> IO ()
set_physics_material_override cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_physics_material_override
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "set_physics_material_override"
           '[PhysicsMaterial]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.set_physics_material_override

{-# NOINLINE bindRigidBody_set_sleeping #-}

bindRigidBody_set_sleeping :: MethodBind
bindRigidBody_set_sleeping
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_sleeping" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_sleeping ::
               (RigidBody :< cls, Object :< cls) => cls -> Bool -> IO ()
set_sleeping cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_sleeping (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "set_sleeping" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.RigidBody.set_sleeping

{-# NOINLINE bindRigidBody_set_use_continuous_collision_detection
             #-}

bindRigidBody_set_use_continuous_collision_detection :: MethodBind
bindRigidBody_set_use_continuous_collision_detection
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_use_continuous_collision_detection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_use_continuous_collision_detection ::
                                         (RigidBody :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_continuous_collision_detection cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindRigidBody_set_use_continuous_collision_detection
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody
           "set_use_continuous_collision_detection"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.RigidBody.set_use_continuous_collision_detection

{-# NOINLINE bindRigidBody_set_use_custom_integrator #-}

bindRigidBody_set_use_custom_integrator :: MethodBind
bindRigidBody_set_use_custom_integrator
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_use_custom_integrator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_use_custom_integrator ::
                            (RigidBody :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_custom_integrator cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_use_custom_integrator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "set_use_custom_integrator" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.set_use_custom_integrator

{-# NOINLINE bindRigidBody_set_weight #-}

bindRigidBody_set_weight :: MethodBind
bindRigidBody_set_weight
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_weight" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_weight ::
             (RigidBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_weight cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_weight (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "set_weight" '[Float] (IO ()) where
        nodeMethod = Godot.Core.RigidBody.set_weight