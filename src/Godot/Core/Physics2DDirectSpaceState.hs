{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Physics2DDirectSpaceState
       (Godot.Core.Physics2DDirectSpaceState.cast_motion,
        Godot.Core.Physics2DDirectSpaceState.collide_shape,
        Godot.Core.Physics2DDirectSpaceState.get_rest_info,
        Godot.Core.Physics2DDirectSpaceState.intersect_point,
        Godot.Core.Physics2DDirectSpaceState.intersect_point_on_canvas,
        Godot.Core.Physics2DDirectSpaceState.intersect_ray,
        Godot.Core.Physics2DDirectSpaceState.intersect_shape)
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

{-# NOINLINE bindPhysics2DDirectSpaceState_cast_motion #-}

bindPhysics2DDirectSpaceState_cast_motion :: MethodBind
bindPhysics2DDirectSpaceState_cast_motion
  = unsafePerformIO $
      withCString "Physics2DDirectSpaceState" $
        \ clsNamePtr ->
          withCString "cast_motion" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

cast_motion ::
              (Physics2DDirectSpaceState :< cls, Object :< cls) =>
              cls -> Physics2DShapeQueryParameters -> IO Array
cast_motion cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DDirectSpaceState_cast_motion
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectSpaceState "cast_motion"
           '[Physics2DShapeQueryParameters]
           (IO Array)
         where
        nodeMethod = Godot.Core.Physics2DDirectSpaceState.cast_motion

{-# NOINLINE bindPhysics2DDirectSpaceState_collide_shape #-}

bindPhysics2DDirectSpaceState_collide_shape :: MethodBind
bindPhysics2DDirectSpaceState_collide_shape
  = unsafePerformIO $
      withCString "Physics2DDirectSpaceState" $
        \ clsNamePtr ->
          withCString "collide_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

collide_shape ::
                (Physics2DDirectSpaceState :< cls, Object :< cls) =>
                cls -> Physics2DShapeQueryParameters -> Maybe Int -> IO Array
collide_shape cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (32)) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DDirectSpaceState_collide_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectSpaceState "collide_shape"
           '[Physics2DShapeQueryParameters, Maybe Int]
           (IO Array)
         where
        nodeMethod = Godot.Core.Physics2DDirectSpaceState.collide_shape

{-# NOINLINE bindPhysics2DDirectSpaceState_get_rest_info #-}

bindPhysics2DDirectSpaceState_get_rest_info :: MethodBind
bindPhysics2DDirectSpaceState_get_rest_info
  = unsafePerformIO $
      withCString "Physics2DDirectSpaceState" $
        \ clsNamePtr ->
          withCString "get_rest_info" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_rest_info ::
                (Physics2DDirectSpaceState :< cls, Object :< cls) =>
                cls -> Physics2DShapeQueryParameters -> IO Dictionary
get_rest_info cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DDirectSpaceState_get_rest_info
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectSpaceState "get_rest_info"
           '[Physics2DShapeQueryParameters]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.Physics2DDirectSpaceState.get_rest_info

{-# NOINLINE bindPhysics2DDirectSpaceState_intersect_point #-}

bindPhysics2DDirectSpaceState_intersect_point :: MethodBind
bindPhysics2DDirectSpaceState_intersect_point
  = unsafePerformIO $
      withCString "Physics2DDirectSpaceState" $
        \ clsNamePtr ->
          withCString "intersect_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

intersect_point ::
                  (Physics2DDirectSpaceState :< cls, Object :< cls) =>
                  cls ->
                    Vector2 ->
                      Maybe Int ->
                        Maybe Array -> Maybe Int -> Maybe Bool -> Maybe Bool -> IO Array
intersect_point cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (32)) toVariant arg2,
       defaultedVariant VariantArray V.empty arg3,
       maybe (VariantInt (2147483647)) toVariant arg4,
       maybe (VariantBool True) toVariant arg5,
       maybe (VariantBool False) toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectSpaceState_intersect_point
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectSpaceState "intersect_point"
           '[Vector2, Maybe Int, Maybe Array, Maybe Int, Maybe Bool,
             Maybe Bool]
           (IO Array)
         where
        nodeMethod = Godot.Core.Physics2DDirectSpaceState.intersect_point

{-# NOINLINE bindPhysics2DDirectSpaceState_intersect_point_on_canvas
             #-}

bindPhysics2DDirectSpaceState_intersect_point_on_canvas ::
                                                        MethodBind
bindPhysics2DDirectSpaceState_intersect_point_on_canvas
  = unsafePerformIO $
      withCString "Physics2DDirectSpaceState" $
        \ clsNamePtr ->
          withCString "intersect_point_on_canvas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

intersect_point_on_canvas ::
                            (Physics2DDirectSpaceState :< cls, Object :< cls) =>
                            cls ->
                              Vector2 ->
                                Int ->
                                  Maybe Int ->
                                    Maybe Array -> Maybe Int -> Maybe Bool -> Maybe Bool -> IO Array
intersect_point_on_canvas cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantInt (32)) toVariant arg3,
       defaultedVariant VariantArray V.empty arg4,
       maybe (VariantInt (2147483647)) toVariant arg5,
       maybe (VariantBool True) toVariant arg6,
       maybe (VariantBool False) toVariant arg7]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectSpaceState_intersect_point_on_canvas
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectSpaceState
           "intersect_point_on_canvas"
           '[Vector2, Int, Maybe Int, Maybe Array, Maybe Int, Maybe Bool,
             Maybe Bool]
           (IO Array)
         where
        nodeMethod
          = Godot.Core.Physics2DDirectSpaceState.intersect_point_on_canvas

{-# NOINLINE bindPhysics2DDirectSpaceState_intersect_ray #-}

bindPhysics2DDirectSpaceState_intersect_ray :: MethodBind
bindPhysics2DDirectSpaceState_intersect_ray
  = unsafePerformIO $
      withCString "Physics2DDirectSpaceState" $
        \ clsNamePtr ->
          withCString "intersect_ray" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

intersect_ray ::
                (Physics2DDirectSpaceState :< cls, Object :< cls) =>
                cls ->
                  Vector2 ->
                    Vector2 ->
                      Maybe Array ->
                        Maybe Int -> Maybe Bool -> Maybe Bool -> IO Dictionary
intersect_ray cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       defaultedVariant VariantArray V.empty arg3,
       maybe (VariantInt (2147483647)) toVariant arg4,
       maybe (VariantBool True) toVariant arg5,
       maybe (VariantBool False) toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DDirectSpaceState_intersect_ray
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectSpaceState "intersect_ray"
           '[Vector2, Vector2, Maybe Array, Maybe Int, Maybe Bool, Maybe Bool]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.Physics2DDirectSpaceState.intersect_ray

{-# NOINLINE bindPhysics2DDirectSpaceState_intersect_shape #-}

bindPhysics2DDirectSpaceState_intersect_shape :: MethodBind
bindPhysics2DDirectSpaceState_intersect_shape
  = unsafePerformIO $
      withCString "Physics2DDirectSpaceState" $
        \ clsNamePtr ->
          withCString "intersect_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

intersect_shape ::
                  (Physics2DDirectSpaceState :< cls, Object :< cls) =>
                  cls -> Physics2DShapeQueryParameters -> Maybe Int -> IO Array
intersect_shape cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (32)) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectSpaceState_intersect_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectSpaceState "intersect_shape"
           '[Physics2DShapeQueryParameters, Maybe Int]
           (IO Array)
         where
        nodeMethod = Godot.Core.Physics2DDirectSpaceState.intersect_shape