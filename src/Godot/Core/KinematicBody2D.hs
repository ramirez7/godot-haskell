{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.KinematicBody2D
       (Godot.Core.KinematicBody2D._direct_state_changed,
        Godot.Core.KinematicBody2D.get_floor_normal,
        Godot.Core.KinematicBody2D.get_floor_velocity,
        Godot.Core.KinematicBody2D.get_safe_margin,
        Godot.Core.KinematicBody2D.get_slide_collision,
        Godot.Core.KinematicBody2D.get_slide_count,
        Godot.Core.KinematicBody2D.is_on_ceiling,
        Godot.Core.KinematicBody2D.is_on_floor,
        Godot.Core.KinematicBody2D.is_on_wall,
        Godot.Core.KinematicBody2D.is_sync_to_physics_enabled,
        Godot.Core.KinematicBody2D.move_and_collide,
        Godot.Core.KinematicBody2D.move_and_slide,
        Godot.Core.KinematicBody2D.move_and_slide_with_snap,
        Godot.Core.KinematicBody2D.set_safe_margin,
        Godot.Core.KinematicBody2D.set_sync_to_physics,
        Godot.Core.KinematicBody2D.test_move)
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
import Godot.Core.PhysicsBody2D()

instance NodeProperty KinematicBody2D "collision/safe_margin" Float
           'False
         where
        nodeProperty
          = (get_safe_margin, wrapDroppingSetter set_safe_margin, Nothing)

instance NodeProperty KinematicBody2D "motion/sync_to_physics" Bool
           'False
         where
        nodeProperty
          = (is_sync_to_physics_enabled,
             wrapDroppingSetter set_sync_to_physics, Nothing)

{-# NOINLINE bindKinematicBody2D__direct_state_changed #-}

bindKinematicBody2D__direct_state_changed :: MethodBind
bindKinematicBody2D__direct_state_changed
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "_direct_state_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_direct_state_changed ::
                        (KinematicBody2D :< cls, Object :< cls) => cls -> Object -> IO ()
_direct_state_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D__direct_state_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "_direct_state_changed"
           '[Object]
           (IO ())
         where
        nodeMethod = Godot.Core.KinematicBody2D._direct_state_changed

{-# NOINLINE bindKinematicBody2D_get_floor_normal #-}

bindKinematicBody2D_get_floor_normal :: MethodBind
bindKinematicBody2D_get_floor_normal
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "get_floor_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_floor_normal ::
                   (KinematicBody2D :< cls, Object :< cls) => cls -> IO Vector2
get_floor_normal cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_get_floor_normal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "get_floor_normal" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.KinematicBody2D.get_floor_normal

{-# NOINLINE bindKinematicBody2D_get_floor_velocity #-}

bindKinematicBody2D_get_floor_velocity :: MethodBind
bindKinematicBody2D_get_floor_velocity
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "get_floor_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_floor_velocity ::
                     (KinematicBody2D :< cls, Object :< cls) => cls -> IO Vector2
get_floor_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_get_floor_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "get_floor_velocity" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.KinematicBody2D.get_floor_velocity

{-# NOINLINE bindKinematicBody2D_get_safe_margin #-}

bindKinematicBody2D_get_safe_margin :: MethodBind
bindKinematicBody2D_get_safe_margin
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "get_safe_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_safe_margin ::
                  (KinematicBody2D :< cls, Object :< cls) => cls -> IO Float
get_safe_margin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_get_safe_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "get_safe_margin" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.KinematicBody2D.get_safe_margin

{-# NOINLINE bindKinematicBody2D_get_slide_collision #-}

bindKinematicBody2D_get_slide_collision :: MethodBind
bindKinematicBody2D_get_slide_collision
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "get_slide_collision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_slide_collision ::
                      (KinematicBody2D :< cls, Object :< cls) =>
                      cls -> Int -> IO KinematicCollision2D
get_slide_collision cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_get_slide_collision
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "get_slide_collision" '[Int]
           (IO KinematicCollision2D)
         where
        nodeMethod = Godot.Core.KinematicBody2D.get_slide_collision

{-# NOINLINE bindKinematicBody2D_get_slide_count #-}

bindKinematicBody2D_get_slide_count :: MethodBind
bindKinematicBody2D_get_slide_count
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "get_slide_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_slide_count ::
                  (KinematicBody2D :< cls, Object :< cls) => cls -> IO Int
get_slide_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_get_slide_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "get_slide_count" '[] (IO Int)
         where
        nodeMethod = Godot.Core.KinematicBody2D.get_slide_count

{-# NOINLINE bindKinematicBody2D_is_on_ceiling #-}

bindKinematicBody2D_is_on_ceiling :: MethodBind
bindKinematicBody2D_is_on_ceiling
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "is_on_ceiling" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_on_ceiling ::
                (KinematicBody2D :< cls, Object :< cls) => cls -> IO Bool
is_on_ceiling cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_is_on_ceiling
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "is_on_ceiling" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.KinematicBody2D.is_on_ceiling

{-# NOINLINE bindKinematicBody2D_is_on_floor #-}

bindKinematicBody2D_is_on_floor :: MethodBind
bindKinematicBody2D_is_on_floor
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "is_on_floor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_on_floor ::
              (KinematicBody2D :< cls, Object :< cls) => cls -> IO Bool
is_on_floor cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_is_on_floor (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "is_on_floor" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.KinematicBody2D.is_on_floor

{-# NOINLINE bindKinematicBody2D_is_on_wall #-}

bindKinematicBody2D_is_on_wall :: MethodBind
bindKinematicBody2D_is_on_wall
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "is_on_wall" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_on_wall ::
             (KinematicBody2D :< cls, Object :< cls) => cls -> IO Bool
is_on_wall cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_is_on_wall (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "is_on_wall" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.KinematicBody2D.is_on_wall

{-# NOINLINE bindKinematicBody2D_is_sync_to_physics_enabled #-}

bindKinematicBody2D_is_sync_to_physics_enabled :: MethodBind
bindKinematicBody2D_is_sync_to_physics_enabled
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "is_sync_to_physics_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_sync_to_physics_enabled ::
                             (KinematicBody2D :< cls, Object :< cls) => cls -> IO Bool
is_sync_to_physics_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindKinematicBody2D_is_sync_to_physics_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "is_sync_to_physics_enabled"
           '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.KinematicBody2D.is_sync_to_physics_enabled

{-# NOINLINE bindKinematicBody2D_move_and_collide #-}

bindKinematicBody2D_move_and_collide :: MethodBind
bindKinematicBody2D_move_and_collide
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "move_and_collide" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

move_and_collide ::
                   (KinematicBody2D :< cls, Object :< cls) =>
                   cls ->
                     Vector2 ->
                       Maybe Bool -> Maybe Bool -> Maybe Bool -> IO KinematicCollision2D
move_and_collide cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, maybe (VariantBool True) toVariant arg2,
       maybe (VariantBool True) toVariant arg3,
       maybe (VariantBool False) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_move_and_collide
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "move_and_collide"
           '[Vector2, Maybe Bool, Maybe Bool, Maybe Bool]
           (IO KinematicCollision2D)
         where
        nodeMethod = Godot.Core.KinematicBody2D.move_and_collide

{-# NOINLINE bindKinematicBody2D_move_and_slide #-}

bindKinematicBody2D_move_and_slide :: MethodBind
bindKinematicBody2D_move_and_slide
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "move_and_slide" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

move_and_slide ::
                 (KinematicBody2D :< cls, Object :< cls) =>
                 cls ->
                   Vector2 ->
                     Maybe Vector2 ->
                       Maybe Bool -> Maybe Int -> Maybe Float -> Maybe Bool -> IO Vector2
move_and_slide cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, defaultedVariant VariantVector2 (V2 0 0) arg2,
       maybe (VariantBool False) toVariant arg3,
       maybe (VariantInt (4)) toVariant arg4,
       maybe (VariantReal (0.785398)) toVariant arg5,
       maybe (VariantBool True) toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_move_and_slide
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "move_and_slide"
           '[Vector2, Maybe Vector2, Maybe Bool, Maybe Int, Maybe Float,
             Maybe Bool]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.KinematicBody2D.move_and_slide

{-# NOINLINE bindKinematicBody2D_move_and_slide_with_snap #-}

bindKinematicBody2D_move_and_slide_with_snap :: MethodBind
bindKinematicBody2D_move_and_slide_with_snap
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "move_and_slide_with_snap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

move_and_slide_with_snap ::
                           (KinematicBody2D :< cls, Object :< cls) =>
                           cls ->
                             Vector2 ->
                               Vector2 ->
                                 Maybe Vector2 ->
                                   Maybe Bool ->
                                     Maybe Int -> Maybe Float -> Maybe Bool -> IO Vector2
move_and_slide_with_snap cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       defaultedVariant VariantVector2 (V2 0 0) arg3,
       maybe (VariantBool False) toVariant arg4,
       maybe (VariantInt (4)) toVariant arg5,
       maybe (VariantReal (0.785398)) toVariant arg6,
       maybe (VariantBool True) toVariant arg7]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_move_and_slide_with_snap
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "move_and_slide_with_snap"
           '[Vector2, Vector2, Maybe Vector2, Maybe Bool, Maybe Int,
             Maybe Float, Maybe Bool]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.KinematicBody2D.move_and_slide_with_snap

{-# NOINLINE bindKinematicBody2D_set_safe_margin #-}

bindKinematicBody2D_set_safe_margin :: MethodBind
bindKinematicBody2D_set_safe_margin
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "set_safe_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_safe_margin ::
                  (KinematicBody2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_safe_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_set_safe_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "set_safe_margin" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.KinematicBody2D.set_safe_margin

{-# NOINLINE bindKinematicBody2D_set_sync_to_physics #-}

bindKinematicBody2D_set_sync_to_physics :: MethodBind
bindKinematicBody2D_set_sync_to_physics
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "set_sync_to_physics" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_sync_to_physics ::
                      (KinematicBody2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_sync_to_physics cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_set_sync_to_physics
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "set_sync_to_physics" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.KinematicBody2D.set_sync_to_physics

{-# NOINLINE bindKinematicBody2D_test_move #-}

bindKinematicBody2D_test_move :: MethodBind
bindKinematicBody2D_test_move
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "test_move" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

test_move ::
            (KinematicBody2D :< cls, Object :< cls) =>
            cls -> Transform2d -> Vector2 -> Maybe Bool -> IO Bool
test_move cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantBool True) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_test_move (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "test_move"
           '[Transform2d, Vector2, Maybe Bool]
           (IO Bool)
         where
        nodeMethod = Godot.Core.KinematicBody2D.test_move