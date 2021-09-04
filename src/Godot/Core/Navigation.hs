{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Navigation
       (Godot.Core.Navigation.get_closest_point,
        Godot.Core.Navigation.get_closest_point_normal,
        Godot.Core.Navigation.get_closest_point_owner,
        Godot.Core.Navigation.get_closest_point_to_segment,
        Godot.Core.Navigation.get_simple_path,
        Godot.Core.Navigation.get_up_vector,
        Godot.Core.Navigation.navmesh_add,
        Godot.Core.Navigation.navmesh_remove,
        Godot.Core.Navigation.navmesh_set_transform,
        Godot.Core.Navigation.set_up_vector)
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

instance NodeProperty Navigation "up_vector" Vector3 'False where
        nodeProperty
          = (get_up_vector, wrapDroppingSetter set_up_vector, Nothing)

{-# NOINLINE bindNavigation_get_closest_point #-}

bindNavigation_get_closest_point :: MethodBind
bindNavigation_get_closest_point
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "get_closest_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_closest_point ::
                    (Navigation :< cls, Object :< cls) => cls -> Vector3 -> IO Vector3
get_closest_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_get_closest_point
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Navigation "get_closest_point" '[Vector3]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.Navigation.get_closest_point

{-# NOINLINE bindNavigation_get_closest_point_normal #-}

bindNavigation_get_closest_point_normal :: MethodBind
bindNavigation_get_closest_point_normal
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "get_closest_point_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_closest_point_normal ::
                           (Navigation :< cls, Object :< cls) => cls -> Vector3 -> IO Vector3
get_closest_point_normal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_get_closest_point_normal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Navigation "get_closest_point_normal"
           '[Vector3]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.Navigation.get_closest_point_normal

{-# NOINLINE bindNavigation_get_closest_point_owner #-}

bindNavigation_get_closest_point_owner :: MethodBind
bindNavigation_get_closest_point_owner
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "get_closest_point_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_closest_point_owner ::
                          (Navigation :< cls, Object :< cls) => cls -> Vector3 -> IO Object
get_closest_point_owner cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_get_closest_point_owner
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Navigation "get_closest_point_owner" '[Vector3]
           (IO Object)
         where
        nodeMethod = Godot.Core.Navigation.get_closest_point_owner

{-# NOINLINE bindNavigation_get_closest_point_to_segment #-}

bindNavigation_get_closest_point_to_segment :: MethodBind
bindNavigation_get_closest_point_to_segment
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "get_closest_point_to_segment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_closest_point_to_segment ::
                               (Navigation :< cls, Object :< cls) =>
                               cls -> Vector3 -> Vector3 -> Maybe Bool -> IO Vector3
get_closest_point_to_segment cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantBool False) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_get_closest_point_to_segment
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Navigation "get_closest_point_to_segment"
           '[Vector3, Vector3, Maybe Bool]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.Navigation.get_closest_point_to_segment

{-# NOINLINE bindNavigation_get_simple_path #-}

bindNavigation_get_simple_path :: MethodBind
bindNavigation_get_simple_path
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "get_simple_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_simple_path ::
                  (Navigation :< cls, Object :< cls) =>
                  cls -> Vector3 -> Vector3 -> Maybe Bool -> IO PoolVector3Array
get_simple_path cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantBool True) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_get_simple_path (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Navigation "get_simple_path"
           '[Vector3, Vector3, Maybe Bool]
           (IO PoolVector3Array)
         where
        nodeMethod = Godot.Core.Navigation.get_simple_path

{-# NOINLINE bindNavigation_get_up_vector #-}

bindNavigation_get_up_vector :: MethodBind
bindNavigation_get_up_vector
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "get_up_vector" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_up_vector ::
                (Navigation :< cls, Object :< cls) => cls -> IO Vector3
get_up_vector cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_get_up_vector (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Navigation "get_up_vector" '[] (IO Vector3)
         where
        nodeMethod = Godot.Core.Navigation.get_up_vector

{-# NOINLINE bindNavigation_navmesh_add #-}

bindNavigation_navmesh_add :: MethodBind
bindNavigation_navmesh_add
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "navmesh_add" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

navmesh_add ::
              (Navigation :< cls, Object :< cls) =>
              cls -> NavigationMesh -> Transform -> Maybe Object -> IO Int
navmesh_add cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2, maybe VariantNil toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_navmesh_add (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Navigation "navmesh_add"
           '[NavigationMesh, Transform, Maybe Object]
           (IO Int)
         where
        nodeMethod = Godot.Core.Navigation.navmesh_add

{-# NOINLINE bindNavigation_navmesh_remove #-}

bindNavigation_navmesh_remove :: MethodBind
bindNavigation_navmesh_remove
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "navmesh_remove" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

navmesh_remove ::
                 (Navigation :< cls, Object :< cls) => cls -> Int -> IO ()
navmesh_remove cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_navmesh_remove (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Navigation "navmesh_remove" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Navigation.navmesh_remove

{-# NOINLINE bindNavigation_navmesh_set_transform #-}

bindNavigation_navmesh_set_transform :: MethodBind
bindNavigation_navmesh_set_transform
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "navmesh_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

navmesh_set_transform ::
                        (Navigation :< cls, Object :< cls) =>
                        cls -> Int -> Transform -> IO ()
navmesh_set_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_navmesh_set_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Navigation "navmesh_set_transform"
           '[Int, Transform]
           (IO ())
         where
        nodeMethod = Godot.Core.Navigation.navmesh_set_transform

{-# NOINLINE bindNavigation_set_up_vector #-}

bindNavigation_set_up_vector :: MethodBind
bindNavigation_set_up_vector
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "set_up_vector" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_up_vector ::
                (Navigation :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_up_vector cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_set_up_vector (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Navigation "set_up_vector" '[Vector3] (IO ())
         where
        nodeMethod = Godot.Core.Navigation.set_up_vector