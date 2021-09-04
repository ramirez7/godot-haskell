{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.NetworkedMultiplayerPeer
       (Godot.Core.NetworkedMultiplayerPeer._CONNECTION_DISCONNECTED,
        Godot.Core.NetworkedMultiplayerPeer._TRANSFER_MODE_UNRELIABLE,
        Godot.Core.NetworkedMultiplayerPeer._CONNECTION_CONNECTED,
        Godot.Core.NetworkedMultiplayerPeer._TARGET_PEER_SERVER,
        Godot.Core.NetworkedMultiplayerPeer._TARGET_PEER_BROADCAST,
        Godot.Core.NetworkedMultiplayerPeer._CONNECTION_CONNECTING,
        Godot.Core.NetworkedMultiplayerPeer._TRANSFER_MODE_RELIABLE,
        Godot.Core.NetworkedMultiplayerPeer._TRANSFER_MODE_UNRELIABLE_ORDERED,
        Godot.Core.NetworkedMultiplayerPeer.sig_connection_failed,
        Godot.Core.NetworkedMultiplayerPeer.sig_connection_succeeded,
        Godot.Core.NetworkedMultiplayerPeer.sig_peer_connected,
        Godot.Core.NetworkedMultiplayerPeer.sig_peer_disconnected,
        Godot.Core.NetworkedMultiplayerPeer.sig_server_disconnected,
        Godot.Core.NetworkedMultiplayerPeer.get_connection_status,
        Godot.Core.NetworkedMultiplayerPeer.get_packet_peer,
        Godot.Core.NetworkedMultiplayerPeer.get_transfer_mode,
        Godot.Core.NetworkedMultiplayerPeer.get_unique_id,
        Godot.Core.NetworkedMultiplayerPeer.is_refusing_new_connections,
        Godot.Core.NetworkedMultiplayerPeer.poll,
        Godot.Core.NetworkedMultiplayerPeer.set_refuse_new_connections,
        Godot.Core.NetworkedMultiplayerPeer.set_target_peer,
        Godot.Core.NetworkedMultiplayerPeer.set_transfer_mode)
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
import Godot.Core.PacketPeer()

_CONNECTION_DISCONNECTED :: Int
_CONNECTION_DISCONNECTED = 0

_TRANSFER_MODE_UNRELIABLE :: Int
_TRANSFER_MODE_UNRELIABLE = 0

_CONNECTION_CONNECTED :: Int
_CONNECTION_CONNECTED = 2

_TARGET_PEER_SERVER :: Int
_TARGET_PEER_SERVER = 1

_TARGET_PEER_BROADCAST :: Int
_TARGET_PEER_BROADCAST = 0

_CONNECTION_CONNECTING :: Int
_CONNECTION_CONNECTING = 1

_TRANSFER_MODE_RELIABLE :: Int
_TRANSFER_MODE_RELIABLE = 2

_TRANSFER_MODE_UNRELIABLE_ORDERED :: Int
_TRANSFER_MODE_UNRELIABLE_ORDERED = 1

sig_connection_failed ::
                      Godot.Internal.Dispatch.Signal NetworkedMultiplayerPeer
sig_connection_failed
  = Godot.Internal.Dispatch.Signal "connection_failed"

instance NodeSignal NetworkedMultiplayerPeer "connection_failed"
           '[]

sig_connection_succeeded ::
                         Godot.Internal.Dispatch.Signal NetworkedMultiplayerPeer
sig_connection_succeeded
  = Godot.Internal.Dispatch.Signal "connection_succeeded"

instance NodeSignal NetworkedMultiplayerPeer "connection_succeeded"
           '[]

sig_peer_connected ::
                   Godot.Internal.Dispatch.Signal NetworkedMultiplayerPeer
sig_peer_connected
  = Godot.Internal.Dispatch.Signal "peer_connected"

instance NodeSignal NetworkedMultiplayerPeer "peer_connected"
           '[Int]

sig_peer_disconnected ::
                      Godot.Internal.Dispatch.Signal NetworkedMultiplayerPeer
sig_peer_disconnected
  = Godot.Internal.Dispatch.Signal "peer_disconnected"

instance NodeSignal NetworkedMultiplayerPeer "peer_disconnected"
           '[Int]

sig_server_disconnected ::
                        Godot.Internal.Dispatch.Signal NetworkedMultiplayerPeer
sig_server_disconnected
  = Godot.Internal.Dispatch.Signal "server_disconnected"

instance NodeSignal NetworkedMultiplayerPeer "server_disconnected"
           '[]

instance NodeProperty NetworkedMultiplayerPeer
           "refuse_new_connections"
           Bool
           'False
         where
        nodeProperty
          = (is_refusing_new_connections,
             wrapDroppingSetter set_refuse_new_connections, Nothing)

instance NodeProperty NetworkedMultiplayerPeer "transfer_mode" Int
           'False
         where
        nodeProperty
          = (get_transfer_mode, wrapDroppingSetter set_transfer_mode,
             Nothing)

{-# NOINLINE bindNetworkedMultiplayerPeer_get_connection_status #-}

bindNetworkedMultiplayerPeer_get_connection_status :: MethodBind
bindNetworkedMultiplayerPeer_get_connection_status
  = unsafePerformIO $
      withCString "NetworkedMultiplayerPeer" $
        \ clsNamePtr ->
          withCString "get_connection_status" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_connection_status ::
                        (NetworkedMultiplayerPeer :< cls, Object :< cls) => cls -> IO Int
get_connection_status cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNetworkedMultiplayerPeer_get_connection_status
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NetworkedMultiplayerPeer
           "get_connection_status"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.NetworkedMultiplayerPeer.get_connection_status

{-# NOINLINE bindNetworkedMultiplayerPeer_get_packet_peer #-}

bindNetworkedMultiplayerPeer_get_packet_peer :: MethodBind
bindNetworkedMultiplayerPeer_get_packet_peer
  = unsafePerformIO $
      withCString "NetworkedMultiplayerPeer" $
        \ clsNamePtr ->
          withCString "get_packet_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_packet_peer ::
                  (NetworkedMultiplayerPeer :< cls, Object :< cls) => cls -> IO Int
get_packet_peer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNetworkedMultiplayerPeer_get_packet_peer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NetworkedMultiplayerPeer "get_packet_peer" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.NetworkedMultiplayerPeer.get_packet_peer

{-# NOINLINE bindNetworkedMultiplayerPeer_get_transfer_mode #-}

bindNetworkedMultiplayerPeer_get_transfer_mode :: MethodBind
bindNetworkedMultiplayerPeer_get_transfer_mode
  = unsafePerformIO $
      withCString "NetworkedMultiplayerPeer" $
        \ clsNamePtr ->
          withCString "get_transfer_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_transfer_mode ::
                    (NetworkedMultiplayerPeer :< cls, Object :< cls) => cls -> IO Int
get_transfer_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNetworkedMultiplayerPeer_get_transfer_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NetworkedMultiplayerPeer "get_transfer_mode"
           '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.NetworkedMultiplayerPeer.get_transfer_mode

{-# NOINLINE bindNetworkedMultiplayerPeer_get_unique_id #-}

bindNetworkedMultiplayerPeer_get_unique_id :: MethodBind
bindNetworkedMultiplayerPeer_get_unique_id
  = unsafePerformIO $
      withCString "NetworkedMultiplayerPeer" $
        \ clsNamePtr ->
          withCString "get_unique_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_unique_id ::
                (NetworkedMultiplayerPeer :< cls, Object :< cls) => cls -> IO Int
get_unique_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNetworkedMultiplayerPeer_get_unique_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NetworkedMultiplayerPeer "get_unique_id" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.NetworkedMultiplayerPeer.get_unique_id

{-# NOINLINE bindNetworkedMultiplayerPeer_is_refusing_new_connections
             #-}

bindNetworkedMultiplayerPeer_is_refusing_new_connections ::
                                                         MethodBind
bindNetworkedMultiplayerPeer_is_refusing_new_connections
  = unsafePerformIO $
      withCString "NetworkedMultiplayerPeer" $
        \ clsNamePtr ->
          withCString "is_refusing_new_connections" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_refusing_new_connections ::
                              (NetworkedMultiplayerPeer :< cls, Object :< cls) => cls -> IO Bool
is_refusing_new_connections cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNetworkedMultiplayerPeer_is_refusing_new_connections
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NetworkedMultiplayerPeer
           "is_refusing_new_connections"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.NetworkedMultiplayerPeer.is_refusing_new_connections

{-# NOINLINE bindNetworkedMultiplayerPeer_poll #-}

bindNetworkedMultiplayerPeer_poll :: MethodBind
bindNetworkedMultiplayerPeer_poll
  = unsafePerformIO $
      withCString "NetworkedMultiplayerPeer" $
        \ clsNamePtr ->
          withCString "poll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

poll ::
       (NetworkedMultiplayerPeer :< cls, Object :< cls) => cls -> IO ()
poll cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNetworkedMultiplayerPeer_poll
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NetworkedMultiplayerPeer "poll" '[] (IO ())
         where
        nodeMethod = Godot.Core.NetworkedMultiplayerPeer.poll

{-# NOINLINE bindNetworkedMultiplayerPeer_set_refuse_new_connections
             #-}

bindNetworkedMultiplayerPeer_set_refuse_new_connections ::
                                                        MethodBind
bindNetworkedMultiplayerPeer_set_refuse_new_connections
  = unsafePerformIO $
      withCString "NetworkedMultiplayerPeer" $
        \ clsNamePtr ->
          withCString "set_refuse_new_connections" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_refuse_new_connections ::
                             (NetworkedMultiplayerPeer :< cls, Object :< cls) =>
                             cls -> Bool -> IO ()
set_refuse_new_connections cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNetworkedMultiplayerPeer_set_refuse_new_connections
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NetworkedMultiplayerPeer
           "set_refuse_new_connections"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.NetworkedMultiplayerPeer.set_refuse_new_connections

{-# NOINLINE bindNetworkedMultiplayerPeer_set_target_peer #-}

bindNetworkedMultiplayerPeer_set_target_peer :: MethodBind
bindNetworkedMultiplayerPeer_set_target_peer
  = unsafePerformIO $
      withCString "NetworkedMultiplayerPeer" $
        \ clsNamePtr ->
          withCString "set_target_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_target_peer ::
                  (NetworkedMultiplayerPeer :< cls, Object :< cls) =>
                  cls -> Int -> IO ()
set_target_peer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNetworkedMultiplayerPeer_set_target_peer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NetworkedMultiplayerPeer "set_target_peer"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.NetworkedMultiplayerPeer.set_target_peer

{-# NOINLINE bindNetworkedMultiplayerPeer_set_transfer_mode #-}

bindNetworkedMultiplayerPeer_set_transfer_mode :: MethodBind
bindNetworkedMultiplayerPeer_set_transfer_mode
  = unsafePerformIO $
      withCString "NetworkedMultiplayerPeer" $
        \ clsNamePtr ->
          withCString "set_transfer_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_transfer_mode ::
                    (NetworkedMultiplayerPeer :< cls, Object :< cls) =>
                    cls -> Int -> IO ()
set_transfer_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNetworkedMultiplayerPeer_set_transfer_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NetworkedMultiplayerPeer "set_transfer_mode"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.NetworkedMultiplayerPeer.set_transfer_mode