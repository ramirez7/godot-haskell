{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.TileSet
       (Godot.Core.TileSet._BITMASK_2X2, Godot.Core.TileSet._BITMASK_3X3,
        Godot.Core.TileSet._BIND_BOTTOMLEFT,
        Godot.Core.TileSet._BIND_CENTER, Godot.Core.TileSet._BIND_LEFT,
        Godot.Core.TileSet._ATLAS_TILE,
        Godot.Core.TileSet._BITMASK_3X3_MINIMAL,
        Godot.Core.TileSet._BIND_RIGHT, Godot.Core.TileSet._BIND_TOPLEFT,
        Godot.Core.TileSet._BIND_BOTTOM,
        Godot.Core.TileSet._BIND_BOTTOMRIGHT,
        Godot.Core.TileSet._AUTO_TILE, Godot.Core.TileSet._BIND_TOP,
        Godot.Core.TileSet._BIND_TOPRIGHT, Godot.Core.TileSet._SINGLE_TILE,
        Godot.Core.TileSet._forward_atlas_subtile_selection,
        Godot.Core.TileSet._forward_subtile_selection,
        Godot.Core.TileSet._is_tile_bound,
        Godot.Core.TileSet.autotile_clear_bitmask_map,
        Godot.Core.TileSet.autotile_get_bitmask,
        Godot.Core.TileSet.autotile_get_bitmask_mode,
        Godot.Core.TileSet.autotile_get_icon_coordinate,
        Godot.Core.TileSet.autotile_get_light_occluder,
        Godot.Core.TileSet.autotile_get_navigation_polygon,
        Godot.Core.TileSet.autotile_get_size,
        Godot.Core.TileSet.autotile_get_spacing,
        Godot.Core.TileSet.autotile_get_subtile_priority,
        Godot.Core.TileSet.autotile_get_z_index,
        Godot.Core.TileSet.autotile_set_bitmask,
        Godot.Core.TileSet.autotile_set_bitmask_mode,
        Godot.Core.TileSet.autotile_set_icon_coordinate,
        Godot.Core.TileSet.autotile_set_light_occluder,
        Godot.Core.TileSet.autotile_set_navigation_polygon,
        Godot.Core.TileSet.autotile_set_size,
        Godot.Core.TileSet.autotile_set_spacing,
        Godot.Core.TileSet.autotile_set_subtile_priority,
        Godot.Core.TileSet.autotile_set_z_index, Godot.Core.TileSet.clear,
        Godot.Core.TileSet.create_tile,
        Godot.Core.TileSet.find_tile_by_name,
        Godot.Core.TileSet.get_last_unused_tile_id,
        Godot.Core.TileSet.get_tiles_ids, Godot.Core.TileSet.remove_tile,
        Godot.Core.TileSet.tile_add_shape,
        Godot.Core.TileSet.tile_get_light_occluder,
        Godot.Core.TileSet.tile_get_material,
        Godot.Core.TileSet.tile_get_modulate,
        Godot.Core.TileSet.tile_get_name,
        Godot.Core.TileSet.tile_get_navigation_polygon,
        Godot.Core.TileSet.tile_get_navigation_polygon_offset,
        Godot.Core.TileSet.tile_get_normal_map,
        Godot.Core.TileSet.tile_get_occluder_offset,
        Godot.Core.TileSet.tile_get_region,
        Godot.Core.TileSet.tile_get_shape,
        Godot.Core.TileSet.tile_get_shape_count,
        Godot.Core.TileSet.tile_get_shape_offset,
        Godot.Core.TileSet.tile_get_shape_one_way,
        Godot.Core.TileSet.tile_get_shape_one_way_margin,
        Godot.Core.TileSet.tile_get_shape_transform,
        Godot.Core.TileSet.tile_get_shapes,
        Godot.Core.TileSet.tile_get_texture,
        Godot.Core.TileSet.tile_get_texture_offset,
        Godot.Core.TileSet.tile_get_tile_mode,
        Godot.Core.TileSet.tile_get_z_index,
        Godot.Core.TileSet.tile_set_light_occluder,
        Godot.Core.TileSet.tile_set_material,
        Godot.Core.TileSet.tile_set_modulate,
        Godot.Core.TileSet.tile_set_name,
        Godot.Core.TileSet.tile_set_navigation_polygon,
        Godot.Core.TileSet.tile_set_navigation_polygon_offset,
        Godot.Core.TileSet.tile_set_normal_map,
        Godot.Core.TileSet.tile_set_occluder_offset,
        Godot.Core.TileSet.tile_set_region,
        Godot.Core.TileSet.tile_set_shape,
        Godot.Core.TileSet.tile_set_shape_offset,
        Godot.Core.TileSet.tile_set_shape_one_way,
        Godot.Core.TileSet.tile_set_shape_one_way_margin,
        Godot.Core.TileSet.tile_set_shape_transform,
        Godot.Core.TileSet.tile_set_shapes,
        Godot.Core.TileSet.tile_set_texture,
        Godot.Core.TileSet.tile_set_texture_offset,
        Godot.Core.TileSet.tile_set_tile_mode,
        Godot.Core.TileSet.tile_set_z_index)
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
import Godot.Core.Resource()

_BITMASK_2X2 :: Int
_BITMASK_2X2 = 0

_BITMASK_3X3 :: Int
_BITMASK_3X3 = 2

_BIND_BOTTOMLEFT :: Int
_BIND_BOTTOMLEFT = 64

_BIND_CENTER :: Int
_BIND_CENTER = 16

_BIND_LEFT :: Int
_BIND_LEFT = 8

_ATLAS_TILE :: Int
_ATLAS_TILE = 2

_BITMASK_3X3_MINIMAL :: Int
_BITMASK_3X3_MINIMAL = 1

_BIND_RIGHT :: Int
_BIND_RIGHT = 32

_BIND_TOPLEFT :: Int
_BIND_TOPLEFT = 1

_BIND_BOTTOM :: Int
_BIND_BOTTOM = 128

_BIND_BOTTOMRIGHT :: Int
_BIND_BOTTOMRIGHT = 256

_AUTO_TILE :: Int
_AUTO_TILE = 1

_BIND_TOP :: Int
_BIND_TOP = 2

_BIND_TOPRIGHT :: Int
_BIND_TOPRIGHT = 4

_SINGLE_TILE :: Int
_SINGLE_TILE = 0

{-# NOINLINE bindTileSet__forward_atlas_subtile_selection #-}

bindTileSet__forward_atlas_subtile_selection :: MethodBind
bindTileSet__forward_atlas_subtile_selection
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "_forward_atlas_subtile_selection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_forward_atlas_subtile_selection ::
                                   (TileSet :< cls, Object :< cls) =>
                                   cls -> Int -> Object -> Vector2 -> IO Vector2
_forward_atlas_subtile_selection cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet__forward_atlas_subtile_selection
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "_forward_atlas_subtile_selection"
           '[Int, Object, Vector2]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.TileSet._forward_atlas_subtile_selection

{-# NOINLINE bindTileSet__forward_subtile_selection #-}

bindTileSet__forward_subtile_selection :: MethodBind
bindTileSet__forward_subtile_selection
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "_forward_subtile_selection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_forward_subtile_selection ::
                             (TileSet :< cls, Object :< cls) =>
                             cls -> Int -> Int -> Object -> Vector2 -> IO Vector2
_forward_subtile_selection cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet__forward_subtile_selection
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "_forward_subtile_selection"
           '[Int, Int, Object, Vector2]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.TileSet._forward_subtile_selection

{-# NOINLINE bindTileSet__is_tile_bound #-}

bindTileSet__is_tile_bound :: MethodBind
bindTileSet__is_tile_bound
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "_is_tile_bound" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_is_tile_bound ::
                 (TileSet :< cls, Object :< cls) => cls -> Int -> Int -> IO Bool
_is_tile_bound cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet__is_tile_bound (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "_is_tile_bound" '[Int, Int] (IO Bool)
         where
        nodeMethod = Godot.Core.TileSet._is_tile_bound

{-# NOINLINE bindTileSet_autotile_clear_bitmask_map #-}

bindTileSet_autotile_clear_bitmask_map :: MethodBind
bindTileSet_autotile_clear_bitmask_map
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_clear_bitmask_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

autotile_clear_bitmask_map ::
                             (TileSet :< cls, Object :< cls) => cls -> Int -> IO ()
autotile_clear_bitmask_map cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_clear_bitmask_map
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_clear_bitmask_map" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.autotile_clear_bitmask_map

{-# NOINLINE bindTileSet_autotile_get_bitmask #-}

bindTileSet_autotile_get_bitmask :: MethodBind
bindTileSet_autotile_get_bitmask
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_get_bitmask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

autotile_get_bitmask ::
                       (TileSet :< cls, Object :< cls) => cls -> Int -> Vector2 -> IO Int
autotile_get_bitmask cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_get_bitmask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_get_bitmask" '[Int, Vector2]
           (IO Int)
         where
        nodeMethod = Godot.Core.TileSet.autotile_get_bitmask

{-# NOINLINE bindTileSet_autotile_get_bitmask_mode #-}

bindTileSet_autotile_get_bitmask_mode :: MethodBind
bindTileSet_autotile_get_bitmask_mode
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_get_bitmask_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

autotile_get_bitmask_mode ::
                            (TileSet :< cls, Object :< cls) => cls -> Int -> IO Int
autotile_get_bitmask_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_get_bitmask_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_get_bitmask_mode" '[Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.TileSet.autotile_get_bitmask_mode

{-# NOINLINE bindTileSet_autotile_get_icon_coordinate #-}

bindTileSet_autotile_get_icon_coordinate :: MethodBind
bindTileSet_autotile_get_icon_coordinate
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_get_icon_coordinate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

autotile_get_icon_coordinate ::
                               (TileSet :< cls, Object :< cls) => cls -> Int -> IO Vector2
autotile_get_icon_coordinate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_get_icon_coordinate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_get_icon_coordinate" '[Int]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.TileSet.autotile_get_icon_coordinate

{-# NOINLINE bindTileSet_autotile_get_light_occluder #-}

bindTileSet_autotile_get_light_occluder :: MethodBind
bindTileSet_autotile_get_light_occluder
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_get_light_occluder" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

autotile_get_light_occluder ::
                              (TileSet :< cls, Object :< cls) =>
                              cls -> Int -> Vector2 -> IO OccluderPolygon2D
autotile_get_light_occluder cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_get_light_occluder
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_get_light_occluder"
           '[Int, Vector2]
           (IO OccluderPolygon2D)
         where
        nodeMethod = Godot.Core.TileSet.autotile_get_light_occluder

{-# NOINLINE bindTileSet_autotile_get_navigation_polygon #-}

bindTileSet_autotile_get_navigation_polygon :: MethodBind
bindTileSet_autotile_get_navigation_polygon
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_get_navigation_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

autotile_get_navigation_polygon ::
                                  (TileSet :< cls, Object :< cls) =>
                                  cls -> Int -> Vector2 -> IO NavigationPolygon
autotile_get_navigation_polygon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_get_navigation_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_get_navigation_polygon"
           '[Int, Vector2]
           (IO NavigationPolygon)
         where
        nodeMethod = Godot.Core.TileSet.autotile_get_navigation_polygon

{-# NOINLINE bindTileSet_autotile_get_size #-}

bindTileSet_autotile_get_size :: MethodBind
bindTileSet_autotile_get_size
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_get_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

autotile_get_size ::
                    (TileSet :< cls, Object :< cls) => cls -> Int -> IO Vector2
autotile_get_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_get_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_get_size" '[Int] (IO Vector2)
         where
        nodeMethod = Godot.Core.TileSet.autotile_get_size

{-# NOINLINE bindTileSet_autotile_get_spacing #-}

bindTileSet_autotile_get_spacing :: MethodBind
bindTileSet_autotile_get_spacing
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_get_spacing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

autotile_get_spacing ::
                       (TileSet :< cls, Object :< cls) => cls -> Int -> IO Int
autotile_get_spacing cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_get_spacing
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_get_spacing" '[Int] (IO Int)
         where
        nodeMethod = Godot.Core.TileSet.autotile_get_spacing

{-# NOINLINE bindTileSet_autotile_get_subtile_priority #-}

bindTileSet_autotile_get_subtile_priority :: MethodBind
bindTileSet_autotile_get_subtile_priority
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_get_subtile_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

autotile_get_subtile_priority ::
                                (TileSet :< cls, Object :< cls) => cls -> Int -> Vector2 -> IO Int
autotile_get_subtile_priority cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_get_subtile_priority
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_get_subtile_priority"
           '[Int, Vector2]
           (IO Int)
         where
        nodeMethod = Godot.Core.TileSet.autotile_get_subtile_priority

{-# NOINLINE bindTileSet_autotile_get_z_index #-}

bindTileSet_autotile_get_z_index :: MethodBind
bindTileSet_autotile_get_z_index
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_get_z_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

autotile_get_z_index ::
                       (TileSet :< cls, Object :< cls) => cls -> Int -> Vector2 -> IO Int
autotile_get_z_index cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_get_z_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_get_z_index" '[Int, Vector2]
           (IO Int)
         where
        nodeMethod = Godot.Core.TileSet.autotile_get_z_index

{-# NOINLINE bindTileSet_autotile_set_bitmask #-}

bindTileSet_autotile_set_bitmask :: MethodBind
bindTileSet_autotile_set_bitmask
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_set_bitmask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

autotile_set_bitmask ::
                       (TileSet :< cls, Object :< cls) =>
                       cls -> Int -> Vector2 -> Int -> IO ()
autotile_set_bitmask cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_set_bitmask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_set_bitmask"
           '[Int, Vector2, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.autotile_set_bitmask

{-# NOINLINE bindTileSet_autotile_set_bitmask_mode #-}

bindTileSet_autotile_set_bitmask_mode :: MethodBind
bindTileSet_autotile_set_bitmask_mode
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_set_bitmask_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

autotile_set_bitmask_mode ::
                            (TileSet :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
autotile_set_bitmask_mode cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_set_bitmask_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_set_bitmask_mode" '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.autotile_set_bitmask_mode

{-# NOINLINE bindTileSet_autotile_set_icon_coordinate #-}

bindTileSet_autotile_set_icon_coordinate :: MethodBind
bindTileSet_autotile_set_icon_coordinate
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_set_icon_coordinate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

autotile_set_icon_coordinate ::
                               (TileSet :< cls, Object :< cls) => cls -> Int -> Vector2 -> IO ()
autotile_set_icon_coordinate cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_set_icon_coordinate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_set_icon_coordinate"
           '[Int, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.autotile_set_icon_coordinate

{-# NOINLINE bindTileSet_autotile_set_light_occluder #-}

bindTileSet_autotile_set_light_occluder :: MethodBind
bindTileSet_autotile_set_light_occluder
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_set_light_occluder" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

autotile_set_light_occluder ::
                              (TileSet :< cls, Object :< cls) =>
                              cls -> Int -> OccluderPolygon2D -> Vector2 -> IO ()
autotile_set_light_occluder cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_set_light_occluder
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_set_light_occluder"
           '[Int, OccluderPolygon2D, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.autotile_set_light_occluder

{-# NOINLINE bindTileSet_autotile_set_navigation_polygon #-}

bindTileSet_autotile_set_navigation_polygon :: MethodBind
bindTileSet_autotile_set_navigation_polygon
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_set_navigation_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

autotile_set_navigation_polygon ::
                                  (TileSet :< cls, Object :< cls) =>
                                  cls -> Int -> NavigationPolygon -> Vector2 -> IO ()
autotile_set_navigation_polygon cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_set_navigation_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_set_navigation_polygon"
           '[Int, NavigationPolygon, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.autotile_set_navigation_polygon

{-# NOINLINE bindTileSet_autotile_set_size #-}

bindTileSet_autotile_set_size :: MethodBind
bindTileSet_autotile_set_size
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_set_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

autotile_set_size ::
                    (TileSet :< cls, Object :< cls) => cls -> Int -> Vector2 -> IO ()
autotile_set_size cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_set_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_set_size" '[Int, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.autotile_set_size

{-# NOINLINE bindTileSet_autotile_set_spacing #-}

bindTileSet_autotile_set_spacing :: MethodBind
bindTileSet_autotile_set_spacing
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_set_spacing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

autotile_set_spacing ::
                       (TileSet :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
autotile_set_spacing cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_set_spacing
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_set_spacing" '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.autotile_set_spacing

{-# NOINLINE bindTileSet_autotile_set_subtile_priority #-}

bindTileSet_autotile_set_subtile_priority :: MethodBind
bindTileSet_autotile_set_subtile_priority
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_set_subtile_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

autotile_set_subtile_priority ::
                                (TileSet :< cls, Object :< cls) =>
                                cls -> Int -> Vector2 -> Int -> IO ()
autotile_set_subtile_priority cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_set_subtile_priority
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_set_subtile_priority"
           '[Int, Vector2, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.autotile_set_subtile_priority

{-# NOINLINE bindTileSet_autotile_set_z_index #-}

bindTileSet_autotile_set_z_index :: MethodBind
bindTileSet_autotile_set_z_index
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_set_z_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

autotile_set_z_index ::
                       (TileSet :< cls, Object :< cls) =>
                       cls -> Int -> Vector2 -> Int -> IO ()
autotile_set_z_index cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_set_z_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_set_z_index"
           '[Int, Vector2, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.autotile_set_z_index

{-# NOINLINE bindTileSet_clear #-}

bindTileSet_clear :: MethodBind
bindTileSet_clear
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

clear :: (TileSet :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_clear (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "clear" '[] (IO ()) where
        nodeMethod = Godot.Core.TileSet.clear

{-# NOINLINE bindTileSet_create_tile #-}

bindTileSet_create_tile :: MethodBind
bindTileSet_create_tile
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "create_tile" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

create_tile ::
              (TileSet :< cls, Object :< cls) => cls -> Int -> IO ()
create_tile cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_create_tile (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "create_tile" '[Int] (IO ()) where
        nodeMethod = Godot.Core.TileSet.create_tile

{-# NOINLINE bindTileSet_find_tile_by_name #-}

bindTileSet_find_tile_by_name :: MethodBind
bindTileSet_find_tile_by_name
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "find_tile_by_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

find_tile_by_name ::
                    (TileSet :< cls, Object :< cls) => cls -> GodotString -> IO Int
find_tile_by_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_find_tile_by_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "find_tile_by_name" '[GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.TileSet.find_tile_by_name

{-# NOINLINE bindTileSet_get_last_unused_tile_id #-}

bindTileSet_get_last_unused_tile_id :: MethodBind
bindTileSet_get_last_unused_tile_id
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "get_last_unused_tile_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_last_unused_tile_id ::
                          (TileSet :< cls, Object :< cls) => cls -> IO Int
get_last_unused_tile_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_get_last_unused_tile_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "get_last_unused_tile_id" '[] (IO Int)
         where
        nodeMethod = Godot.Core.TileSet.get_last_unused_tile_id

{-# NOINLINE bindTileSet_get_tiles_ids #-}

bindTileSet_get_tiles_ids :: MethodBind
bindTileSet_get_tiles_ids
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "get_tiles_ids" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_tiles_ids :: (TileSet :< cls, Object :< cls) => cls -> IO Array
get_tiles_ids cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_get_tiles_ids (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "get_tiles_ids" '[] (IO Array) where
        nodeMethod = Godot.Core.TileSet.get_tiles_ids

{-# NOINLINE bindTileSet_remove_tile #-}

bindTileSet_remove_tile :: MethodBind
bindTileSet_remove_tile
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "remove_tile" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_tile ::
              (TileSet :< cls, Object :< cls) => cls -> Int -> IO ()
remove_tile cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_remove_tile (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "remove_tile" '[Int] (IO ()) where
        nodeMethod = Godot.Core.TileSet.remove_tile

{-# NOINLINE bindTileSet_tile_add_shape #-}

bindTileSet_tile_add_shape :: MethodBind
bindTileSet_tile_add_shape
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_add_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_add_shape ::
                 (TileSet :< cls, Object :< cls) =>
                 cls ->
                   Int ->
                     Shape2D -> Transform2d -> Maybe Bool -> Maybe Vector2 -> IO ()
tile_add_shape cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       maybe (VariantBool False) toVariant arg4,
       defaultedVariant VariantVector2 (V2 0 0) arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_add_shape (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_add_shape"
           '[Int, Shape2D, Transform2d, Maybe Bool, Maybe Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_add_shape

{-# NOINLINE bindTileSet_tile_get_light_occluder #-}

bindTileSet_tile_get_light_occluder :: MethodBind
bindTileSet_tile_get_light_occluder
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_light_occluder" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_get_light_occluder ::
                          (TileSet :< cls, Object :< cls) =>
                          cls -> Int -> IO OccluderPolygon2D
tile_get_light_occluder cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_light_occluder
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_light_occluder" '[Int]
           (IO OccluderPolygon2D)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_light_occluder

{-# NOINLINE bindTileSet_tile_get_material #-}

bindTileSet_tile_get_material :: MethodBind
bindTileSet_tile_get_material
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_get_material ::
                    (TileSet :< cls, Object :< cls) => cls -> Int -> IO ShaderMaterial
tile_get_material cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_material (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_material" '[Int]
           (IO ShaderMaterial)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_material

{-# NOINLINE bindTileSet_tile_get_modulate #-}

bindTileSet_tile_get_modulate :: MethodBind
bindTileSet_tile_get_modulate
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_get_modulate ::
                    (TileSet :< cls, Object :< cls) => cls -> Int -> IO Color
tile_get_modulate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_modulate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_modulate" '[Int] (IO Color)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_modulate

{-# NOINLINE bindTileSet_tile_get_name #-}

bindTileSet_tile_get_name :: MethodBind
bindTileSet_tile_get_name
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_get_name ::
                (TileSet :< cls, Object :< cls) => cls -> Int -> IO GodotString
tile_get_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_name" '[Int] (IO GodotString)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_name

{-# NOINLINE bindTileSet_tile_get_navigation_polygon #-}

bindTileSet_tile_get_navigation_polygon :: MethodBind
bindTileSet_tile_get_navigation_polygon
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_navigation_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_get_navigation_polygon ::
                              (TileSet :< cls, Object :< cls) =>
                              cls -> Int -> IO NavigationPolygon
tile_get_navigation_polygon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_navigation_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_navigation_polygon" '[Int]
           (IO NavigationPolygon)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_navigation_polygon

{-# NOINLINE bindTileSet_tile_get_navigation_polygon_offset #-}

bindTileSet_tile_get_navigation_polygon_offset :: MethodBind
bindTileSet_tile_get_navigation_polygon_offset
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_navigation_polygon_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_get_navigation_polygon_offset ::
                                     (TileSet :< cls, Object :< cls) => cls -> Int -> IO Vector2
tile_get_navigation_polygon_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindTileSet_tile_get_navigation_polygon_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_navigation_polygon_offset"
           '[Int]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_navigation_polygon_offset

{-# NOINLINE bindTileSet_tile_get_normal_map #-}

bindTileSet_tile_get_normal_map :: MethodBind
bindTileSet_tile_get_normal_map
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_normal_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_get_normal_map ::
                      (TileSet :< cls, Object :< cls) => cls -> Int -> IO Texture
tile_get_normal_map cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_normal_map (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_normal_map" '[Int]
           (IO Texture)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_normal_map

{-# NOINLINE bindTileSet_tile_get_occluder_offset #-}

bindTileSet_tile_get_occluder_offset :: MethodBind
bindTileSet_tile_get_occluder_offset
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_occluder_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_get_occluder_offset ::
                           (TileSet :< cls, Object :< cls) => cls -> Int -> IO Vector2
tile_get_occluder_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_occluder_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_occluder_offset" '[Int]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_occluder_offset

{-# NOINLINE bindTileSet_tile_get_region #-}

bindTileSet_tile_get_region :: MethodBind
bindTileSet_tile_get_region
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_get_region ::
                  (TileSet :< cls, Object :< cls) => cls -> Int -> IO Rect2
tile_get_region cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_region (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_region" '[Int] (IO Rect2)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_region

{-# NOINLINE bindTileSet_tile_get_shape #-}

bindTileSet_tile_get_shape :: MethodBind
bindTileSet_tile_get_shape
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_get_shape ::
                 (TileSet :< cls, Object :< cls) => cls -> Int -> Int -> IO Shape2D
tile_get_shape cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_shape (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_shape" '[Int, Int]
           (IO Shape2D)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_shape

{-# NOINLINE bindTileSet_tile_get_shape_count #-}

bindTileSet_tile_get_shape_count :: MethodBind
bindTileSet_tile_get_shape_count
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_shape_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_get_shape_count ::
                       (TileSet :< cls, Object :< cls) => cls -> Int -> IO Int
tile_get_shape_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_shape_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_shape_count" '[Int] (IO Int)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_shape_count

{-# NOINLINE bindTileSet_tile_get_shape_offset #-}

bindTileSet_tile_get_shape_offset :: MethodBind
bindTileSet_tile_get_shape_offset
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_shape_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_get_shape_offset ::
                        (TileSet :< cls, Object :< cls) => cls -> Int -> Int -> IO Vector2
tile_get_shape_offset cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_shape_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_shape_offset" '[Int, Int]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_shape_offset

{-# NOINLINE bindTileSet_tile_get_shape_one_way #-}

bindTileSet_tile_get_shape_one_way :: MethodBind
bindTileSet_tile_get_shape_one_way
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_shape_one_way" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_get_shape_one_way ::
                         (TileSet :< cls, Object :< cls) => cls -> Int -> Int -> IO Bool
tile_get_shape_one_way cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_shape_one_way
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_shape_one_way" '[Int, Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_shape_one_way

{-# NOINLINE bindTileSet_tile_get_shape_one_way_margin #-}

bindTileSet_tile_get_shape_one_way_margin :: MethodBind
bindTileSet_tile_get_shape_one_way_margin
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_shape_one_way_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_get_shape_one_way_margin ::
                                (TileSet :< cls, Object :< cls) => cls -> Int -> Int -> IO Float
tile_get_shape_one_way_margin cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_shape_one_way_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_shape_one_way_margin"
           '[Int, Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_shape_one_way_margin

{-# NOINLINE bindTileSet_tile_get_shape_transform #-}

bindTileSet_tile_get_shape_transform :: MethodBind
bindTileSet_tile_get_shape_transform
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_shape_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_get_shape_transform ::
                           (TileSet :< cls, Object :< cls) =>
                           cls -> Int -> Int -> IO Transform2d
tile_get_shape_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_shape_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_shape_transform" '[Int, Int]
           (IO Transform2d)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_shape_transform

{-# NOINLINE bindTileSet_tile_get_shapes #-}

bindTileSet_tile_get_shapes :: MethodBind
bindTileSet_tile_get_shapes
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_shapes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_get_shapes ::
                  (TileSet :< cls, Object :< cls) => cls -> Int -> IO Array
tile_get_shapes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_shapes (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_shapes" '[Int] (IO Array)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_shapes

{-# NOINLINE bindTileSet_tile_get_texture #-}

bindTileSet_tile_get_texture :: MethodBind
bindTileSet_tile_get_texture
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_get_texture ::
                   (TileSet :< cls, Object :< cls) => cls -> Int -> IO Texture
tile_get_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_texture" '[Int] (IO Texture)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_texture

{-# NOINLINE bindTileSet_tile_get_texture_offset #-}

bindTileSet_tile_get_texture_offset :: MethodBind
bindTileSet_tile_get_texture_offset
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_texture_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_get_texture_offset ::
                          (TileSet :< cls, Object :< cls) => cls -> Int -> IO Vector2
tile_get_texture_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_texture_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_texture_offset" '[Int]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_texture_offset

{-# NOINLINE bindTileSet_tile_get_tile_mode #-}

bindTileSet_tile_get_tile_mode :: MethodBind
bindTileSet_tile_get_tile_mode
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_tile_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_get_tile_mode ::
                     (TileSet :< cls, Object :< cls) => cls -> Int -> IO Int
tile_get_tile_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_tile_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_tile_mode" '[Int] (IO Int)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_tile_mode

{-# NOINLINE bindTileSet_tile_get_z_index #-}

bindTileSet_tile_get_z_index :: MethodBind
bindTileSet_tile_get_z_index
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_z_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_get_z_index ::
                   (TileSet :< cls, Object :< cls) => cls -> Int -> IO Int
tile_get_z_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_z_index (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_z_index" '[Int] (IO Int)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_z_index

{-# NOINLINE bindTileSet_tile_set_light_occluder #-}

bindTileSet_tile_set_light_occluder :: MethodBind
bindTileSet_tile_set_light_occluder
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_light_occluder" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_set_light_occluder ::
                          (TileSet :< cls, Object :< cls) =>
                          cls -> Int -> OccluderPolygon2D -> IO ()
tile_set_light_occluder cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_light_occluder
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_light_occluder"
           '[Int, OccluderPolygon2D]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_light_occluder

{-# NOINLINE bindTileSet_tile_set_material #-}

bindTileSet_tile_set_material :: MethodBind
bindTileSet_tile_set_material
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_set_material ::
                    (TileSet :< cls, Object :< cls) =>
                    cls -> Int -> ShaderMaterial -> IO ()
tile_set_material cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_material (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_material"
           '[Int, ShaderMaterial]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_material

{-# NOINLINE bindTileSet_tile_set_modulate #-}

bindTileSet_tile_set_modulate :: MethodBind
bindTileSet_tile_set_modulate
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_set_modulate ::
                    (TileSet :< cls, Object :< cls) => cls -> Int -> Color -> IO ()
tile_set_modulate cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_modulate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_modulate" '[Int, Color]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_modulate

{-# NOINLINE bindTileSet_tile_set_name #-}

bindTileSet_tile_set_name :: MethodBind
bindTileSet_tile_set_name
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_set_name ::
                (TileSet :< cls, Object :< cls) =>
                cls -> Int -> GodotString -> IO ()
tile_set_name cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_name" '[Int, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_name

{-# NOINLINE bindTileSet_tile_set_navigation_polygon #-}

bindTileSet_tile_set_navigation_polygon :: MethodBind
bindTileSet_tile_set_navigation_polygon
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_navigation_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_set_navigation_polygon ::
                              (TileSet :< cls, Object :< cls) =>
                              cls -> Int -> NavigationPolygon -> IO ()
tile_set_navigation_polygon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_navigation_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_navigation_polygon"
           '[Int, NavigationPolygon]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_navigation_polygon

{-# NOINLINE bindTileSet_tile_set_navigation_polygon_offset #-}

bindTileSet_tile_set_navigation_polygon_offset :: MethodBind
bindTileSet_tile_set_navigation_polygon_offset
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_navigation_polygon_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_set_navigation_polygon_offset ::
                                     (TileSet :< cls, Object :< cls) =>
                                     cls -> Int -> Vector2 -> IO ()
tile_set_navigation_polygon_offset cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindTileSet_tile_set_navigation_polygon_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_navigation_polygon_offset"
           '[Int, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_navigation_polygon_offset

{-# NOINLINE bindTileSet_tile_set_normal_map #-}

bindTileSet_tile_set_normal_map :: MethodBind
bindTileSet_tile_set_normal_map
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_normal_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_set_normal_map ::
                      (TileSet :< cls, Object :< cls) => cls -> Int -> Texture -> IO ()
tile_set_normal_map cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_normal_map (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_normal_map" '[Int, Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_normal_map

{-# NOINLINE bindTileSet_tile_set_occluder_offset #-}

bindTileSet_tile_set_occluder_offset :: MethodBind
bindTileSet_tile_set_occluder_offset
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_occluder_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_set_occluder_offset ::
                           (TileSet :< cls, Object :< cls) => cls -> Int -> Vector2 -> IO ()
tile_set_occluder_offset cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_occluder_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_occluder_offset"
           '[Int, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_occluder_offset

{-# NOINLINE bindTileSet_tile_set_region #-}

bindTileSet_tile_set_region :: MethodBind
bindTileSet_tile_set_region
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_set_region ::
                  (TileSet :< cls, Object :< cls) => cls -> Int -> Rect2 -> IO ()
tile_set_region cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_region (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_region" '[Int, Rect2] (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_region

{-# NOINLINE bindTileSet_tile_set_shape #-}

bindTileSet_tile_set_shape :: MethodBind
bindTileSet_tile_set_shape
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_set_shape ::
                 (TileSet :< cls, Object :< cls) =>
                 cls -> Int -> Int -> Shape2D -> IO ()
tile_set_shape cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_shape (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_shape" '[Int, Int, Shape2D]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_shape

{-# NOINLINE bindTileSet_tile_set_shape_offset #-}

bindTileSet_tile_set_shape_offset :: MethodBind
bindTileSet_tile_set_shape_offset
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_shape_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_set_shape_offset ::
                        (TileSet :< cls, Object :< cls) =>
                        cls -> Int -> Int -> Vector2 -> IO ()
tile_set_shape_offset cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_shape_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_shape_offset"
           '[Int, Int, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_shape_offset

{-# NOINLINE bindTileSet_tile_set_shape_one_way #-}

bindTileSet_tile_set_shape_one_way :: MethodBind
bindTileSet_tile_set_shape_one_way
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_shape_one_way" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_set_shape_one_way ::
                         (TileSet :< cls, Object :< cls) =>
                         cls -> Int -> Int -> Bool -> IO ()
tile_set_shape_one_way cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_shape_one_way
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_shape_one_way"
           '[Int, Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_shape_one_way

{-# NOINLINE bindTileSet_tile_set_shape_one_way_margin #-}

bindTileSet_tile_set_shape_one_way_margin :: MethodBind
bindTileSet_tile_set_shape_one_way_margin
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_shape_one_way_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_set_shape_one_way_margin ::
                                (TileSet :< cls, Object :< cls) =>
                                cls -> Int -> Int -> Float -> IO ()
tile_set_shape_one_way_margin cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_shape_one_way_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_shape_one_way_margin"
           '[Int, Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_shape_one_way_margin

{-# NOINLINE bindTileSet_tile_set_shape_transform #-}

bindTileSet_tile_set_shape_transform :: MethodBind
bindTileSet_tile_set_shape_transform
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_shape_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_set_shape_transform ::
                           (TileSet :< cls, Object :< cls) =>
                           cls -> Int -> Int -> Transform2d -> IO ()
tile_set_shape_transform cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_shape_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_shape_transform"
           '[Int, Int, Transform2d]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_shape_transform

{-# NOINLINE bindTileSet_tile_set_shapes #-}

bindTileSet_tile_set_shapes :: MethodBind
bindTileSet_tile_set_shapes
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_shapes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_set_shapes ::
                  (TileSet :< cls, Object :< cls) => cls -> Int -> Array -> IO ()
tile_set_shapes cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_shapes (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_shapes" '[Int, Array] (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_shapes

{-# NOINLINE bindTileSet_tile_set_texture #-}

bindTileSet_tile_set_texture :: MethodBind
bindTileSet_tile_set_texture
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_set_texture ::
                   (TileSet :< cls, Object :< cls) => cls -> Int -> Texture -> IO ()
tile_set_texture cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_texture" '[Int, Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_texture

{-# NOINLINE bindTileSet_tile_set_texture_offset #-}

bindTileSet_tile_set_texture_offset :: MethodBind
bindTileSet_tile_set_texture_offset
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_texture_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_set_texture_offset ::
                          (TileSet :< cls, Object :< cls) => cls -> Int -> Vector2 -> IO ()
tile_set_texture_offset cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_texture_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_texture_offset"
           '[Int, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_texture_offset

{-# NOINLINE bindTileSet_tile_set_tile_mode #-}

bindTileSet_tile_set_tile_mode :: MethodBind
bindTileSet_tile_set_tile_mode
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_tile_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_set_tile_mode ::
                     (TileSet :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
tile_set_tile_mode cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_tile_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_tile_mode" '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_tile_mode

{-# NOINLINE bindTileSet_tile_set_z_index #-}

bindTileSet_tile_set_z_index :: MethodBind
bindTileSet_tile_set_z_index
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_z_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_set_z_index ::
                   (TileSet :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
tile_set_z_index cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_z_index (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_z_index" '[Int, Int] (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_z_index