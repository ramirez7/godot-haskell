{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Geometry
       (Godot.Core.Geometry._END_POLYGON, Godot.Core.Geometry._JOIN_ROUND,
        Godot.Core.Geometry._OPERATION_XOR,
        Godot.Core.Geometry._JOIN_MITER, Godot.Core.Geometry._END_JOINED,
        Godot.Core.Geometry._OPERATION_UNION,
        Godot.Core.Geometry._JOIN_SQUARE,
        Godot.Core.Geometry._OPERATION_INTERSECTION,
        Godot.Core.Geometry._END_BUTT, Godot.Core.Geometry._END_ROUND,
        Godot.Core.Geometry._OPERATION_DIFFERENCE,
        Godot.Core.Geometry._END_SQUARE,
        Godot.Core.Geometry.build_box_planes,
        Godot.Core.Geometry.build_capsule_planes,
        Godot.Core.Geometry.build_cylinder_planes,
        Godot.Core.Geometry.clip_polygon,
        Godot.Core.Geometry.clip_polygons_2d,
        Godot.Core.Geometry.clip_polyline_with_polygon_2d,
        Godot.Core.Geometry.convex_hull_2d,
        Godot.Core.Geometry.exclude_polygons_2d,
        Godot.Core.Geometry.get_closest_point_to_segment,
        Godot.Core.Geometry.get_closest_point_to_segment_2d,
        Godot.Core.Geometry.get_closest_point_to_segment_uncapped,
        Godot.Core.Geometry.get_closest_point_to_segment_uncapped_2d,
        Godot.Core.Geometry.get_closest_points_between_segments,
        Godot.Core.Geometry.get_closest_points_between_segments_2d,
        Godot.Core.Geometry.get_uv84_normal_bit,
        Godot.Core.Geometry.intersect_polygons_2d,
        Godot.Core.Geometry.intersect_polyline_with_polygon_2d,
        Godot.Core.Geometry.is_point_in_circle,
        Godot.Core.Geometry.is_point_in_polygon,
        Godot.Core.Geometry.is_polygon_clockwise,
        Godot.Core.Geometry.line_intersects_line_2d,
        Godot.Core.Geometry.make_atlas,
        Godot.Core.Geometry.merge_polygons_2d,
        Godot.Core.Geometry.offset_polygon_2d,
        Godot.Core.Geometry.offset_polyline_2d,
        Godot.Core.Geometry.point_is_inside_triangle,
        Godot.Core.Geometry.ray_intersects_triangle,
        Godot.Core.Geometry.segment_intersects_circle,
        Godot.Core.Geometry.segment_intersects_convex,
        Godot.Core.Geometry.segment_intersects_cylinder,
        Godot.Core.Geometry.segment_intersects_segment_2d,
        Godot.Core.Geometry.segment_intersects_sphere,
        Godot.Core.Geometry.segment_intersects_triangle,
        Godot.Core.Geometry.triangulate_delaunay_2d,
        Godot.Core.Geometry.triangulate_polygon)
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

_END_POLYGON :: Int
_END_POLYGON = 0

_JOIN_ROUND :: Int
_JOIN_ROUND = 1

_OPERATION_XOR :: Int
_OPERATION_XOR = 3

_JOIN_MITER :: Int
_JOIN_MITER = 2

_END_JOINED :: Int
_END_JOINED = 1

_OPERATION_UNION :: Int
_OPERATION_UNION = 0

_JOIN_SQUARE :: Int
_JOIN_SQUARE = 0

_OPERATION_INTERSECTION :: Int
_OPERATION_INTERSECTION = 2

_END_BUTT :: Int
_END_BUTT = 2

_END_ROUND :: Int
_END_ROUND = 4

_OPERATION_DIFFERENCE :: Int
_OPERATION_DIFFERENCE = 1

_END_SQUARE :: Int
_END_SQUARE = 3

{-# NOINLINE bindGeometry_build_box_planes #-}

bindGeometry_build_box_planes :: MethodBind
bindGeometry_build_box_planes
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "build_box_planes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

build_box_planes ::
                   (Geometry :< cls, Object :< cls) => cls -> Vector3 -> IO Array
build_box_planes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_build_box_planes (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "build_box_planes" '[Vector3]
           (IO Array)
         where
        nodeMethod = Godot.Core.Geometry.build_box_planes

{-# NOINLINE bindGeometry_build_capsule_planes #-}

bindGeometry_build_capsule_planes :: MethodBind
bindGeometry_build_capsule_planes
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "build_capsule_planes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

build_capsule_planes ::
                       (Geometry :< cls, Object :< cls) =>
                       cls -> Float -> Float -> Int -> Int -> Maybe Int -> IO Array
build_capsule_planes cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       maybe (VariantInt (2)) toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_build_capsule_planes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "build_capsule_planes"
           '[Float, Float, Int, Int, Maybe Int]
           (IO Array)
         where
        nodeMethod = Godot.Core.Geometry.build_capsule_planes

{-# NOINLINE bindGeometry_build_cylinder_planes #-}

bindGeometry_build_cylinder_planes :: MethodBind
bindGeometry_build_cylinder_planes
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "build_cylinder_planes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

build_cylinder_planes ::
                        (Geometry :< cls, Object :< cls) =>
                        cls -> Float -> Float -> Int -> Maybe Int -> IO Array
build_cylinder_planes cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       maybe (VariantInt (2)) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_build_cylinder_planes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "build_cylinder_planes"
           '[Float, Float, Int, Maybe Int]
           (IO Array)
         where
        nodeMethod = Godot.Core.Geometry.build_cylinder_planes

{-# NOINLINE bindGeometry_clip_polygon #-}

bindGeometry_clip_polygon :: MethodBind
bindGeometry_clip_polygon
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "clip_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

clip_polygon ::
               (Geometry :< cls, Object :< cls) =>
               cls -> PoolVector3Array -> Plane -> IO PoolVector3Array
clip_polygon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_clip_polygon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "clip_polygon"
           '[PoolVector3Array, Plane]
           (IO PoolVector3Array)
         where
        nodeMethod = Godot.Core.Geometry.clip_polygon

{-# NOINLINE bindGeometry_clip_polygons_2d #-}

bindGeometry_clip_polygons_2d :: MethodBind
bindGeometry_clip_polygons_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "clip_polygons_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

clip_polygons_2d ::
                   (Geometry :< cls, Object :< cls) =>
                   cls -> PoolVector2Array -> PoolVector2Array -> IO Array
clip_polygons_2d cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_clip_polygons_2d (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "clip_polygons_2d"
           '[PoolVector2Array, PoolVector2Array]
           (IO Array)
         where
        nodeMethod = Godot.Core.Geometry.clip_polygons_2d

{-# NOINLINE bindGeometry_clip_polyline_with_polygon_2d #-}

bindGeometry_clip_polyline_with_polygon_2d :: MethodBind
bindGeometry_clip_polyline_with_polygon_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "clip_polyline_with_polygon_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

clip_polyline_with_polygon_2d ::
                                (Geometry :< cls, Object :< cls) =>
                                cls -> PoolVector2Array -> PoolVector2Array -> IO Array
clip_polyline_with_polygon_2d cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_clip_polyline_with_polygon_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "clip_polyline_with_polygon_2d"
           '[PoolVector2Array, PoolVector2Array]
           (IO Array)
         where
        nodeMethod = Godot.Core.Geometry.clip_polyline_with_polygon_2d

{-# NOINLINE bindGeometry_convex_hull_2d #-}

bindGeometry_convex_hull_2d :: MethodBind
bindGeometry_convex_hull_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "convex_hull_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

convex_hull_2d ::
                 (Geometry :< cls, Object :< cls) =>
                 cls -> PoolVector2Array -> IO PoolVector2Array
convex_hull_2d cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_convex_hull_2d (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "convex_hull_2d" '[PoolVector2Array]
           (IO PoolVector2Array)
         where
        nodeMethod = Godot.Core.Geometry.convex_hull_2d

{-# NOINLINE bindGeometry_exclude_polygons_2d #-}

bindGeometry_exclude_polygons_2d :: MethodBind
bindGeometry_exclude_polygons_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "exclude_polygons_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

exclude_polygons_2d ::
                      (Geometry :< cls, Object :< cls) =>
                      cls -> PoolVector2Array -> PoolVector2Array -> IO Array
exclude_polygons_2d cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_exclude_polygons_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "exclude_polygons_2d"
           '[PoolVector2Array, PoolVector2Array]
           (IO Array)
         where
        nodeMethod = Godot.Core.Geometry.exclude_polygons_2d

{-# NOINLINE bindGeometry_get_closest_point_to_segment #-}

bindGeometry_get_closest_point_to_segment :: MethodBind
bindGeometry_get_closest_point_to_segment
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "get_closest_point_to_segment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_closest_point_to_segment ::
                               (Geometry :< cls, Object :< cls) =>
                               cls -> Vector3 -> Vector3 -> Vector3 -> IO Vector3
get_closest_point_to_segment cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_get_closest_point_to_segment
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "get_closest_point_to_segment"
           '[Vector3, Vector3, Vector3]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.Geometry.get_closest_point_to_segment

{-# NOINLINE bindGeometry_get_closest_point_to_segment_2d #-}

bindGeometry_get_closest_point_to_segment_2d :: MethodBind
bindGeometry_get_closest_point_to_segment_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "get_closest_point_to_segment_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_closest_point_to_segment_2d ::
                                  (Geometry :< cls, Object :< cls) =>
                                  cls -> Vector2 -> Vector2 -> Vector2 -> IO Vector2
get_closest_point_to_segment_2d cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_get_closest_point_to_segment_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "get_closest_point_to_segment_2d"
           '[Vector2, Vector2, Vector2]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.Geometry.get_closest_point_to_segment_2d

{-# NOINLINE bindGeometry_get_closest_point_to_segment_uncapped #-}

bindGeometry_get_closest_point_to_segment_uncapped :: MethodBind
bindGeometry_get_closest_point_to_segment_uncapped
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "get_closest_point_to_segment_uncapped" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_closest_point_to_segment_uncapped ::
                                        (Geometry :< cls, Object :< cls) =>
                                        cls -> Vector3 -> Vector3 -> Vector3 -> IO Vector3
get_closest_point_to_segment_uncapped cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGeometry_get_closest_point_to_segment_uncapped
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry
           "get_closest_point_to_segment_uncapped"
           '[Vector3, Vector3, Vector3]
           (IO Vector3)
         where
        nodeMethod
          = Godot.Core.Geometry.get_closest_point_to_segment_uncapped

{-# NOINLINE bindGeometry_get_closest_point_to_segment_uncapped_2d
             #-}

bindGeometry_get_closest_point_to_segment_uncapped_2d :: MethodBind
bindGeometry_get_closest_point_to_segment_uncapped_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "get_closest_point_to_segment_uncapped_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_closest_point_to_segment_uncapped_2d ::
                                           (Geometry :< cls, Object :< cls) =>
                                           cls -> Vector2 -> Vector2 -> Vector2 -> IO Vector2
get_closest_point_to_segment_uncapped_2d cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGeometry_get_closest_point_to_segment_uncapped_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry
           "get_closest_point_to_segment_uncapped_2d"
           '[Vector2, Vector2, Vector2]
           (IO Vector2)
         where
        nodeMethod
          = Godot.Core.Geometry.get_closest_point_to_segment_uncapped_2d

{-# NOINLINE bindGeometry_get_closest_points_between_segments #-}

bindGeometry_get_closest_points_between_segments :: MethodBind
bindGeometry_get_closest_points_between_segments
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "get_closest_points_between_segments" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_closest_points_between_segments ::
                                      (Geometry :< cls, Object :< cls) =>
                                      cls ->
                                        Vector3 ->
                                          Vector3 -> Vector3 -> Vector3 -> IO PoolVector3Array
get_closest_points_between_segments cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGeometry_get_closest_points_between_segments
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "get_closest_points_between_segments"
           '[Vector3, Vector3, Vector3, Vector3]
           (IO PoolVector3Array)
         where
        nodeMethod
          = Godot.Core.Geometry.get_closest_points_between_segments

{-# NOINLINE bindGeometry_get_closest_points_between_segments_2d
             #-}

bindGeometry_get_closest_points_between_segments_2d :: MethodBind
bindGeometry_get_closest_points_between_segments_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "get_closest_points_between_segments_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_closest_points_between_segments_2d ::
                                         (Geometry :< cls, Object :< cls) =>
                                         cls ->
                                           Vector2 ->
                                             Vector2 -> Vector2 -> Vector2 -> IO PoolVector2Array
get_closest_points_between_segments_2d cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGeometry_get_closest_points_between_segments_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry
           "get_closest_points_between_segments_2d"
           '[Vector2, Vector2, Vector2, Vector2]
           (IO PoolVector2Array)
         where
        nodeMethod
          = Godot.Core.Geometry.get_closest_points_between_segments_2d

{-# NOINLINE bindGeometry_get_uv84_normal_bit #-}

bindGeometry_get_uv84_normal_bit :: MethodBind
bindGeometry_get_uv84_normal_bit
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "get_uv84_normal_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_uv84_normal_bit ::
                      (Geometry :< cls, Object :< cls) => cls -> Vector3 -> IO Int
get_uv84_normal_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_get_uv84_normal_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "get_uv84_normal_bit" '[Vector3]
           (IO Int)
         where
        nodeMethod = Godot.Core.Geometry.get_uv84_normal_bit

{-# NOINLINE bindGeometry_intersect_polygons_2d #-}

bindGeometry_intersect_polygons_2d :: MethodBind
bindGeometry_intersect_polygons_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "intersect_polygons_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

intersect_polygons_2d ::
                        (Geometry :< cls, Object :< cls) =>
                        cls -> PoolVector2Array -> PoolVector2Array -> IO Array
intersect_polygons_2d cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_intersect_polygons_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "intersect_polygons_2d"
           '[PoolVector2Array, PoolVector2Array]
           (IO Array)
         where
        nodeMethod = Godot.Core.Geometry.intersect_polygons_2d

{-# NOINLINE bindGeometry_intersect_polyline_with_polygon_2d #-}

bindGeometry_intersect_polyline_with_polygon_2d :: MethodBind
bindGeometry_intersect_polyline_with_polygon_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "intersect_polyline_with_polygon_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

intersect_polyline_with_polygon_2d ::
                                     (Geometry :< cls, Object :< cls) =>
                                     cls -> PoolVector2Array -> PoolVector2Array -> IO Array
intersect_polyline_with_polygon_2d cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGeometry_intersect_polyline_with_polygon_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "intersect_polyline_with_polygon_2d"
           '[PoolVector2Array, PoolVector2Array]
           (IO Array)
         where
        nodeMethod = Godot.Core.Geometry.intersect_polyline_with_polygon_2d

{-# NOINLINE bindGeometry_is_point_in_circle #-}

bindGeometry_is_point_in_circle :: MethodBind
bindGeometry_is_point_in_circle
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "is_point_in_circle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_point_in_circle ::
                     (Geometry :< cls, Object :< cls) =>
                     cls -> Vector2 -> Vector2 -> Float -> IO Bool
is_point_in_circle cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_is_point_in_circle (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "is_point_in_circle"
           '[Vector2, Vector2, Float]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Geometry.is_point_in_circle

{-# NOINLINE bindGeometry_is_point_in_polygon #-}

bindGeometry_is_point_in_polygon :: MethodBind
bindGeometry_is_point_in_polygon
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "is_point_in_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_point_in_polygon ::
                      (Geometry :< cls, Object :< cls) =>
                      cls -> Vector2 -> PoolVector2Array -> IO Bool
is_point_in_polygon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_is_point_in_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "is_point_in_polygon"
           '[Vector2, PoolVector2Array]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Geometry.is_point_in_polygon

{-# NOINLINE bindGeometry_is_polygon_clockwise #-}

bindGeometry_is_polygon_clockwise :: MethodBind
bindGeometry_is_polygon_clockwise
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "is_polygon_clockwise" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_polygon_clockwise ::
                       (Geometry :< cls, Object :< cls) =>
                       cls -> PoolVector2Array -> IO Bool
is_polygon_clockwise cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_is_polygon_clockwise
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "is_polygon_clockwise"
           '[PoolVector2Array]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Geometry.is_polygon_clockwise

{-# NOINLINE bindGeometry_line_intersects_line_2d #-}

bindGeometry_line_intersects_line_2d :: MethodBind
bindGeometry_line_intersects_line_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "line_intersects_line_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

line_intersects_line_2d ::
                          (Geometry :< cls, Object :< cls) =>
                          cls -> Vector2 -> Vector2 -> Vector2 -> Vector2 -> IO GodotVariant
line_intersects_line_2d cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_line_intersects_line_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "line_intersects_line_2d"
           '[Vector2, Vector2, Vector2, Vector2]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.Geometry.line_intersects_line_2d

{-# NOINLINE bindGeometry_make_atlas #-}

bindGeometry_make_atlas :: MethodBind
bindGeometry_make_atlas
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "make_atlas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

make_atlas ::
             (Geometry :< cls, Object :< cls) =>
             cls -> PoolVector2Array -> IO Dictionary
make_atlas cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_make_atlas (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "make_atlas" '[PoolVector2Array]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.Geometry.make_atlas

{-# NOINLINE bindGeometry_merge_polygons_2d #-}

bindGeometry_merge_polygons_2d :: MethodBind
bindGeometry_merge_polygons_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "merge_polygons_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

merge_polygons_2d ::
                    (Geometry :< cls, Object :< cls) =>
                    cls -> PoolVector2Array -> PoolVector2Array -> IO Array
merge_polygons_2d cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_merge_polygons_2d (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "merge_polygons_2d"
           '[PoolVector2Array, PoolVector2Array]
           (IO Array)
         where
        nodeMethod = Godot.Core.Geometry.merge_polygons_2d

{-# NOINLINE bindGeometry_offset_polygon_2d #-}

bindGeometry_offset_polygon_2d :: MethodBind
bindGeometry_offset_polygon_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "offset_polygon_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

offset_polygon_2d ::
                    (Geometry :< cls, Object :< cls) =>
                    cls -> PoolVector2Array -> Float -> Maybe Int -> IO Array
offset_polygon_2d cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantInt (0)) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_offset_polygon_2d (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "offset_polygon_2d"
           '[PoolVector2Array, Float, Maybe Int]
           (IO Array)
         where
        nodeMethod = Godot.Core.Geometry.offset_polygon_2d

{-# NOINLINE bindGeometry_offset_polyline_2d #-}

bindGeometry_offset_polyline_2d :: MethodBind
bindGeometry_offset_polyline_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "offset_polyline_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

offset_polyline_2d ::
                     (Geometry :< cls, Object :< cls) =>
                     cls ->
                       PoolVector2Array -> Float -> Maybe Int -> Maybe Int -> IO Array
offset_polyline_2d cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantInt (0)) toVariant arg3,
       maybe (VariantInt (3)) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_offset_polyline_2d (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "offset_polyline_2d"
           '[PoolVector2Array, Float, Maybe Int, Maybe Int]
           (IO Array)
         where
        nodeMethod = Godot.Core.Geometry.offset_polyline_2d

{-# NOINLINE bindGeometry_point_is_inside_triangle #-}

bindGeometry_point_is_inside_triangle :: MethodBind
bindGeometry_point_is_inside_triangle
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "point_is_inside_triangle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

point_is_inside_triangle ::
                           (Geometry :< cls, Object :< cls) =>
                           cls -> Vector2 -> Vector2 -> Vector2 -> Vector2 -> IO Bool
point_is_inside_triangle cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_point_is_inside_triangle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "point_is_inside_triangle"
           '[Vector2, Vector2, Vector2, Vector2]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Geometry.point_is_inside_triangle

{-# NOINLINE bindGeometry_ray_intersects_triangle #-}

bindGeometry_ray_intersects_triangle :: MethodBind
bindGeometry_ray_intersects_triangle
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "ray_intersects_triangle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

ray_intersects_triangle ::
                          (Geometry :< cls, Object :< cls) =>
                          cls ->
                            Vector3 ->
                              Vector3 -> Vector3 -> Vector3 -> Vector3 -> IO GodotVariant
ray_intersects_triangle cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_ray_intersects_triangle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "ray_intersects_triangle"
           '[Vector3, Vector3, Vector3, Vector3, Vector3]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.Geometry.ray_intersects_triangle

{-# NOINLINE bindGeometry_segment_intersects_circle #-}

bindGeometry_segment_intersects_circle :: MethodBind
bindGeometry_segment_intersects_circle
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "segment_intersects_circle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

segment_intersects_circle ::
                            (Geometry :< cls, Object :< cls) =>
                            cls -> Vector2 -> Vector2 -> Vector2 -> Float -> IO Float
segment_intersects_circle cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_segment_intersects_circle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "segment_intersects_circle"
           '[Vector2, Vector2, Vector2, Float]
           (IO Float)
         where
        nodeMethod = Godot.Core.Geometry.segment_intersects_circle

{-# NOINLINE bindGeometry_segment_intersects_convex #-}

bindGeometry_segment_intersects_convex :: MethodBind
bindGeometry_segment_intersects_convex
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "segment_intersects_convex" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

segment_intersects_convex ::
                            (Geometry :< cls, Object :< cls) =>
                            cls -> Vector3 -> Vector3 -> Array -> IO PoolVector3Array
segment_intersects_convex cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_segment_intersects_convex
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "segment_intersects_convex"
           '[Vector3, Vector3, Array]
           (IO PoolVector3Array)
         where
        nodeMethod = Godot.Core.Geometry.segment_intersects_convex

{-# NOINLINE bindGeometry_segment_intersects_cylinder #-}

bindGeometry_segment_intersects_cylinder :: MethodBind
bindGeometry_segment_intersects_cylinder
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "segment_intersects_cylinder" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

segment_intersects_cylinder ::
                              (Geometry :< cls, Object :< cls) =>
                              cls -> Vector3 -> Vector3 -> Float -> Float -> IO PoolVector3Array
segment_intersects_cylinder cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_segment_intersects_cylinder
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "segment_intersects_cylinder"
           '[Vector3, Vector3, Float, Float]
           (IO PoolVector3Array)
         where
        nodeMethod = Godot.Core.Geometry.segment_intersects_cylinder

{-# NOINLINE bindGeometry_segment_intersects_segment_2d #-}

bindGeometry_segment_intersects_segment_2d :: MethodBind
bindGeometry_segment_intersects_segment_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "segment_intersects_segment_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

segment_intersects_segment_2d ::
                                (Geometry :< cls, Object :< cls) =>
                                cls -> Vector2 -> Vector2 -> Vector2 -> Vector2 -> IO GodotVariant
segment_intersects_segment_2d cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_segment_intersects_segment_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "segment_intersects_segment_2d"
           '[Vector2, Vector2, Vector2, Vector2]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.Geometry.segment_intersects_segment_2d

{-# NOINLINE bindGeometry_segment_intersects_sphere #-}

bindGeometry_segment_intersects_sphere :: MethodBind
bindGeometry_segment_intersects_sphere
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "segment_intersects_sphere" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

segment_intersects_sphere ::
                            (Geometry :< cls, Object :< cls) =>
                            cls ->
                              Vector3 -> Vector3 -> Vector3 -> Float -> IO PoolVector3Array
segment_intersects_sphere cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_segment_intersects_sphere
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "segment_intersects_sphere"
           '[Vector3, Vector3, Vector3, Float]
           (IO PoolVector3Array)
         where
        nodeMethod = Godot.Core.Geometry.segment_intersects_sphere

{-# NOINLINE bindGeometry_segment_intersects_triangle #-}

bindGeometry_segment_intersects_triangle :: MethodBind
bindGeometry_segment_intersects_triangle
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "segment_intersects_triangle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

segment_intersects_triangle ::
                              (Geometry :< cls, Object :< cls) =>
                              cls ->
                                Vector3 ->
                                  Vector3 -> Vector3 -> Vector3 -> Vector3 -> IO GodotVariant
segment_intersects_triangle cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_segment_intersects_triangle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "segment_intersects_triangle"
           '[Vector3, Vector3, Vector3, Vector3, Vector3]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.Geometry.segment_intersects_triangle

{-# NOINLINE bindGeometry_triangulate_delaunay_2d #-}

bindGeometry_triangulate_delaunay_2d :: MethodBind
bindGeometry_triangulate_delaunay_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "triangulate_delaunay_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

triangulate_delaunay_2d ::
                          (Geometry :< cls, Object :< cls) =>
                          cls -> PoolVector2Array -> IO PoolIntArray
triangulate_delaunay_2d cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_triangulate_delaunay_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "triangulate_delaunay_2d"
           '[PoolVector2Array]
           (IO PoolIntArray)
         where
        nodeMethod = Godot.Core.Geometry.triangulate_delaunay_2d

{-# NOINLINE bindGeometry_triangulate_polygon #-}

bindGeometry_triangulate_polygon :: MethodBind
bindGeometry_triangulate_polygon
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "triangulate_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

triangulate_polygon ::
                      (Geometry :< cls, Object :< cls) =>
                      cls -> PoolVector2Array -> IO PoolIntArray
triangulate_polygon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_triangulate_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "triangulate_polygon"
           '[PoolVector2Array]
           (IO PoolIntArray)
         where
        nodeMethod = Godot.Core.Geometry.triangulate_polygon