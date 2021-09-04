{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.KinematicBody
       (Godot.Core.KinematicBody.get_axis_lock,
        Godot.Core.KinematicBody.get_floor_normal,
        Godot.Core.KinematicBody.get_floor_velocity,
        Godot.Core.KinematicBody.get_safe_margin,
        Godot.Core.KinematicBody.get_slide_collision,
        Godot.Core.KinematicBody.get_slide_count,
        Godot.Core.KinematicBody.is_on_ceiling,
        Godot.Core.KinematicBody.is_on_floor,
        Godot.Core.KinematicBody.is_on_wall,
        Godot.Core.KinematicBody.move_and_collide,
        Godot.Core.KinematicBody.move_and_slide,
        Godot.Core.KinematicBody.move_and_slide_with_snap,
        Godot.Core.KinematicBody.set_axis_lock,
        Godot.Core.KinematicBody.set_safe_margin,
        Godot.Core.KinematicBody.test_move)
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

instance NodeProperty KinematicBody "collision/safe_margin" Float
           'False
         where
        nodeProperty
          = (get_safe_margin, wrapDroppingSetter set_safe_margin, Nothing)

instance NodeProperty KinematicBody "move_lock_x" Bool 'False where
        nodeProperty
          = (wrapIndexedGetter 1 get_axis_lock,
             wrapIndexedSetter 1 set_axis_lock, Nothing)

instance NodeProperty KinematicBody "move_lock_y" Bool 'False where
        nodeProperty
          = (wrapIndexedGetter 2 get_axis_lock,
             wrapIndexedSetter 2 set_axis_lock, Nothing)

instance NodeProperty KinematicBody "move_lock_z" Bool 'False where
        nodeProperty
          = (wrapIndexedGetter 4 get_axis_lock,
             wrapIndexedSetter 4 set_axis_lock, Nothing)

{-# NOINLINE bindKinematicBody_get_axis_lock #-}

bindKinematicBody_get_axis_lock :: MethodBind
bindKinematicBody_get_axis_lock
  = unsafePerformIO $
      withCString "KinematicBody" $
        \ clsNamePtr ->
          withCString "get_axis_lock" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_axis_lock ::
                (KinematicBody :< cls, Object :< cls) => cls -> Int -> IO Bool
get_axis_lock cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody_get_axis_lock (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody "get_axis_lock" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.KinematicBody.get_axis_lock

{-# NOINLINE bindKinematicBody_get_floor_normal #-}

bindKinematicBody_get_floor_normal :: MethodBind
bindKinematicBody_get_floor_normal
  = unsafePerformIO $
      withCString "KinematicBody" $
        \ clsNamePtr ->
          withCString "get_floor_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_floor_normal ::
                   (KinematicBody :< cls, Object :< cls) => cls -> IO Vector3
get_floor_normal cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody_get_floor_normal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody "get_floor_normal" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.KinematicBody.get_floor_normal

{-# NOINLINE bindKinematicBody_get_floor_velocity #-}

bindKinematicBody_get_floor_velocity :: MethodBind
bindKinematicBody_get_floor_velocity
  = unsafePerformIO $
      withCString "KinematicBody" $
        \ clsNamePtr ->
          withCString "get_floor_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_floor_velocity ::
                     (KinematicBody :< cls, Object :< cls) => cls -> IO Vector3
get_floor_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody_get_floor_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody "get_floor_velocity" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.KinematicBody.get_floor_velocity

{-# NOINLINE bindKinematicBody_get_safe_margin #-}

bindKinematicBody_get_safe_margin :: MethodBind
bindKinematicBody_get_safe_margin
  = unsafePerformIO $
      withCString "KinematicBody" $
        \ clsNamePtr ->
          withCString "get_safe_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_safe_margin ::
                  (KinematicBody :< cls, Object :< cls) => cls -> IO Float
get_safe_margin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody_get_safe_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody "get_safe_margin" '[] (IO Float)
         where
        nodeMethod = Godot.Core.KinematicBody.get_safe_margin

{-# NOINLINE bindKinematicBody_get_slide_collision #-}

bindKinematicBody_get_slide_collision :: MethodBind
bindKinematicBody_get_slide_collision
  = unsafePerformIO $
      withCString "KinematicBody" $
        \ clsNamePtr ->
          withCString "get_slide_collision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_slide_collision ::
                      (KinematicBody :< cls, Object :< cls) =>
                      cls -> Int -> IO KinematicCollision
get_slide_collision cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody_get_slide_collision
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody "get_slide_collision" '[Int]
           (IO KinematicCollision)
         where
        nodeMethod = Godot.Core.KinematicBody.get_slide_collision

{-# NOINLINE bindKinematicBody_get_slide_count #-}

bindKinematicBody_get_slide_count :: MethodBind
bindKinematicBody_get_slide_count
  = unsafePerformIO $
      withCString "KinematicBody" $
        \ clsNamePtr ->
          withCString "get_slide_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_slide_count ::
                  (KinematicBody :< cls, Object :< cls) => cls -> IO Int
get_slide_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody_get_slide_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody "get_slide_count" '[] (IO Int)
         where
        nodeMethod = Godot.Core.KinematicBody.get_slide_count

{-# NOINLINE bindKinematicBody_is_on_ceiling #-}

bindKinematicBody_is_on_ceiling :: MethodBind
bindKinematicBody_is_on_ceiling
  = unsafePerformIO $
      withCString "KinematicBody" $
        \ clsNamePtr ->
          withCString "is_on_ceiling" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_on_ceiling ::
                (KinematicBody :< cls, Object :< cls) => cls -> IO Bool
is_on_ceiling cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody_is_on_ceiling (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody "is_on_ceiling" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.KinematicBody.is_on_ceiling

{-# NOINLINE bindKinematicBody_is_on_floor #-}

bindKinematicBody_is_on_floor :: MethodBind
bindKinematicBody_is_on_floor
  = unsafePerformIO $
      withCString "KinematicBody" $
        \ clsNamePtr ->
          withCString "is_on_floor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_on_floor ::
              (KinematicBody :< cls, Object :< cls) => cls -> IO Bool
is_on_floor cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody_is_on_floor (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody "is_on_floor" '[] (IO Bool) where
        nodeMethod = Godot.Core.KinematicBody.is_on_floor

{-# NOINLINE bindKinematicBody_is_on_wall #-}

bindKinematicBody_is_on_wall :: MethodBind
bindKinematicBody_is_on_wall
  = unsafePerformIO $
      withCString "KinematicBody" $
        \ clsNamePtr ->
          withCString "is_on_wall" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_on_wall ::
             (KinematicBody :< cls, Object :< cls) => cls -> IO Bool
is_on_wall cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody_is_on_wall (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody "is_on_wall" '[] (IO Bool) where
        nodeMethod = Godot.Core.KinematicBody.is_on_wall

{-# NOINLINE bindKinematicBody_move_and_collide #-}

bindKinematicBody_move_and_collide :: MethodBind
bindKinematicBody_move_and_collide
  = unsafePerformIO $
      withCString "KinematicBody" $
        \ clsNamePtr ->
          withCString "move_and_collide" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

move_and_collide ::
                   (KinematicBody :< cls, Object :< cls) =>
                   cls ->
                     Vector3 ->
                       Maybe Bool -> Maybe Bool -> Maybe Bool -> IO KinematicCollision
move_and_collide cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, maybe (VariantBool True) toVariant arg2,
       maybe (VariantBool True) toVariant arg3,
       maybe (VariantBool False) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody_move_and_collide
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody "move_and_collide"
           '[Vector3, Maybe Bool, Maybe Bool, Maybe Bool]
           (IO KinematicCollision)
         where
        nodeMethod = Godot.Core.KinematicBody.move_and_collide

{-# NOINLINE bindKinematicBody_move_and_slide #-}

bindKinematicBody_move_and_slide :: MethodBind
bindKinematicBody_move_and_slide
  = unsafePerformIO $
      withCString "KinematicBody" $
        \ clsNamePtr ->
          withCString "move_and_slide" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

move_and_slide ::
                 (KinematicBody :< cls, Object :< cls) =>
                 cls ->
                   Vector3 ->
                     Maybe Vector3 ->
                       Maybe Bool -> Maybe Int -> Maybe Float -> Maybe Bool -> IO Vector3
move_and_slide cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, defaultedVariant VariantVector3 (V3 0 0 0) arg2,
       maybe (VariantBool False) toVariant arg3,
       maybe (VariantInt (4)) toVariant arg4,
       maybe (VariantReal (0.785398)) toVariant arg5,
       maybe (VariantBool True) toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody_move_and_slide
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody "move_and_slide"
           '[Vector3, Maybe Vector3, Maybe Bool, Maybe Int, Maybe Float,
             Maybe Bool]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.KinematicBody.move_and_slide

{-# NOINLINE bindKinematicBody_move_and_slide_with_snap #-}

bindKinematicBody_move_and_slide_with_snap :: MethodBind
bindKinematicBody_move_and_slide_with_snap
  = unsafePerformIO $
      withCString "KinematicBody" $
        \ clsNamePtr ->
          withCString "move_and_slide_with_snap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

move_and_slide_with_snap ::
                           (KinematicBody :< cls, Object :< cls) =>
                           cls ->
                             Vector3 ->
                               Vector3 ->
                                 Maybe Vector3 ->
                                   Maybe Bool ->
                                     Maybe Int -> Maybe Float -> Maybe Bool -> IO Vector3
move_and_slide_with_snap cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       defaultedVariant VariantVector3 (V3 0 0 0) arg3,
       maybe (VariantBool False) toVariant arg4,
       maybe (VariantInt (4)) toVariant arg5,
       maybe (VariantReal (0.785398)) toVariant arg6,
       maybe (VariantBool True) toVariant arg7]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody_move_and_slide_with_snap
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody "move_and_slide_with_snap"
           '[Vector3, Vector3, Maybe Vector3, Maybe Bool, Maybe Int,
             Maybe Float, Maybe Bool]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.KinematicBody.move_and_slide_with_snap

{-# NOINLINE bindKinematicBody_set_axis_lock #-}

bindKinematicBody_set_axis_lock :: MethodBind
bindKinematicBody_set_axis_lock
  = unsafePerformIO $
      withCString "KinematicBody" $
        \ clsNamePtr ->
          withCString "set_axis_lock" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_axis_lock ::
                (KinematicBody :< cls, Object :< cls) =>
                cls -> Int -> Bool -> IO ()
set_axis_lock cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody_set_axis_lock (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody "set_axis_lock" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.KinematicBody.set_axis_lock

{-# NOINLINE bindKinematicBody_set_safe_margin #-}

bindKinematicBody_set_safe_margin :: MethodBind
bindKinematicBody_set_safe_margin
  = unsafePerformIO $
      withCString "KinematicBody" $
        \ clsNamePtr ->
          withCString "set_safe_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_safe_margin ::
                  (KinematicBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_safe_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody_set_safe_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody "set_safe_margin" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.KinematicBody.set_safe_margin

{-# NOINLINE bindKinematicBody_test_move #-}

bindKinematicBody_test_move :: MethodBind
bindKinematicBody_test_move
  = unsafePerformIO $
      withCString "KinematicBody" $
        \ clsNamePtr ->
          withCString "test_move" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

test_move ::
            (KinematicBody :< cls, Object :< cls) =>
            cls -> Transform -> Vector3 -> Maybe Bool -> IO Bool
test_move cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantBool True) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody_test_move (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody "test_move"
           '[Transform, Vector3, Maybe Bool]
           (IO Bool)
         where
        nodeMethod = Godot.Core.KinematicBody.test_move