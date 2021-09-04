{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.PacketPeerUDP
       (Godot.Core.PacketPeerUDP.close,
        Godot.Core.PacketPeerUDP.connect_to_host,
        Godot.Core.PacketPeerUDP.get_packet_ip,
        Godot.Core.PacketPeerUDP.get_packet_port,
        Godot.Core.PacketPeerUDP.is_connected_to_host,
        Godot.Core.PacketPeerUDP.is_listening,
        Godot.Core.PacketPeerUDP.join_multicast_group,
        Godot.Core.PacketPeerUDP.leave_multicast_group,
        Godot.Core.PacketPeerUDP.listen,
        Godot.Core.PacketPeerUDP.set_broadcast_enabled,
        Godot.Core.PacketPeerUDP.set_dest_address,
        Godot.Core.PacketPeerUDP.wait)
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

{-# NOINLINE bindPacketPeerUDP_close #-}

-- | Closes the @PacketPeerUDP@'s underlying UDP socket.
bindPacketPeerUDP_close :: MethodBind
bindPacketPeerUDP_close
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "close" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Closes the @PacketPeerUDP@'s underlying UDP socket.
close :: (PacketPeerUDP :< cls, Object :< cls) => cls -> IO ()
close cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeerUDP_close (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PacketPeerUDP "close" '[] (IO ()) where
        nodeMethod = Godot.Core.PacketPeerUDP.close

{-# NOINLINE bindPacketPeerUDP_connect_to_host #-}

-- | Calling this method connects this UDP peer to the given @host@/@port@ pair. UDP is in reality connectionless, so this option only means that incoming packets from different addresses are automatically discarded, and that outgoing packets are always sent to the connected address (future calls to @method set_dest_address@ are not allowed). This method does not send any data to the remote peer, to do that, use @method PacketPeer.put_var@ or @method PacketPeer.put_packet@ as usual. See also @UDPServer@.
--   				__Note:__ Connecting to the remote peer does not help to protect from malicious attacks like IP spoofing, etc. Think about using an encryption technique like SSL or DTLS if you feel like your application is transferring sensitive information.
bindPacketPeerUDP_connect_to_host :: MethodBind
bindPacketPeerUDP_connect_to_host
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "connect_to_host" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calling this method connects this UDP peer to the given @host@/@port@ pair. UDP is in reality connectionless, so this option only means that incoming packets from different addresses are automatically discarded, and that outgoing packets are always sent to the connected address (future calls to @method set_dest_address@ are not allowed). This method does not send any data to the remote peer, to do that, use @method PacketPeer.put_var@ or @method PacketPeer.put_packet@ as usual. See also @UDPServer@.
--   				__Note:__ Connecting to the remote peer does not help to protect from malicious attacks like IP spoofing, etc. Think about using an encryption technique like SSL or DTLS if you feel like your application is transferring sensitive information.
connect_to_host ::
                  (PacketPeerUDP :< cls, Object :< cls) =>
                  cls -> GodotString -> Int -> IO Int
connect_to_host cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeerUDP_connect_to_host
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PacketPeerUDP "connect_to_host"
           '[GodotString, Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.PacketPeerUDP.connect_to_host

{-# NOINLINE bindPacketPeerUDP_get_packet_ip #-}

-- | Returns the IP of the remote peer that sent the last packet(that was received with @method PacketPeer.get_packet@ or @method PacketPeer.get_var@).
bindPacketPeerUDP_get_packet_ip :: MethodBind
bindPacketPeerUDP_get_packet_ip
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "get_packet_ip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the IP of the remote peer that sent the last packet(that was received with @method PacketPeer.get_packet@ or @method PacketPeer.get_var@).
get_packet_ip ::
                (PacketPeerUDP :< cls, Object :< cls) => cls -> IO GodotString
get_packet_ip cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeerUDP_get_packet_ip (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PacketPeerUDP "get_packet_ip" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.PacketPeerUDP.get_packet_ip

{-# NOINLINE bindPacketPeerUDP_get_packet_port #-}

-- | Returns the port of the remote peer that sent the last packet(that was received with @method PacketPeer.get_packet@ or @method PacketPeer.get_var@).
bindPacketPeerUDP_get_packet_port :: MethodBind
bindPacketPeerUDP_get_packet_port
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "get_packet_port" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the port of the remote peer that sent the last packet(that was received with @method PacketPeer.get_packet@ or @method PacketPeer.get_var@).
get_packet_port ::
                  (PacketPeerUDP :< cls, Object :< cls) => cls -> IO Int
get_packet_port cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeerUDP_get_packet_port
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PacketPeerUDP "get_packet_port" '[] (IO Int)
         where
        nodeMethod = Godot.Core.PacketPeerUDP.get_packet_port

{-# NOINLINE bindPacketPeerUDP_is_connected_to_host #-}

-- | Returns @true@ if the UDP socket is open and has been connected to a remote address. See @method connect_to_host@.
bindPacketPeerUDP_is_connected_to_host :: MethodBind
bindPacketPeerUDP_is_connected_to_host
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "is_connected_to_host" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the UDP socket is open and has been connected to a remote address. See @method connect_to_host@.
is_connected_to_host ::
                       (PacketPeerUDP :< cls, Object :< cls) => cls -> IO Bool
is_connected_to_host cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeerUDP_is_connected_to_host
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PacketPeerUDP "is_connected_to_host" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.PacketPeerUDP.is_connected_to_host

{-# NOINLINE bindPacketPeerUDP_is_listening #-}

bindPacketPeerUDP_is_listening :: MethodBind
bindPacketPeerUDP_is_listening
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "is_listening" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_listening ::
               (PacketPeerUDP :< cls, Object :< cls) => cls -> IO Bool
is_listening cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeerUDP_is_listening (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PacketPeerUDP "is_listening" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.PacketPeerUDP.is_listening

{-# NOINLINE bindPacketPeerUDP_join_multicast_group #-}

-- | Joins the multicast group specified by @multicast_address@ using the interface identified by @interface_name@.
--   				You can join the same multicast group with multiple interfaces. Use @method IP.get_local_interfaces@ to know which are available.
--   				Note: Some Android devices might require the @CHANGE_WIFI_MULTICAST_STATE@ permission for multicast to work.
bindPacketPeerUDP_join_multicast_group :: MethodBind
bindPacketPeerUDP_join_multicast_group
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "join_multicast_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Joins the multicast group specified by @multicast_address@ using the interface identified by @interface_name@.
--   				You can join the same multicast group with multiple interfaces. Use @method IP.get_local_interfaces@ to know which are available.
--   				Note: Some Android devices might require the @CHANGE_WIFI_MULTICAST_STATE@ permission for multicast to work.
join_multicast_group ::
                       (PacketPeerUDP :< cls, Object :< cls) =>
                       cls -> GodotString -> GodotString -> IO Int
join_multicast_group cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeerUDP_join_multicast_group
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PacketPeerUDP "join_multicast_group"
           '[GodotString, GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.PacketPeerUDP.join_multicast_group

{-# NOINLINE bindPacketPeerUDP_leave_multicast_group #-}

-- | Removes the interface identified by @interface_name@ from the multicast group specified by @multicast_address@.
bindPacketPeerUDP_leave_multicast_group :: MethodBind
bindPacketPeerUDP_leave_multicast_group
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "leave_multicast_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the interface identified by @interface_name@ from the multicast group specified by @multicast_address@.
leave_multicast_group ::
                        (PacketPeerUDP :< cls, Object :< cls) =>
                        cls -> GodotString -> GodotString -> IO Int
leave_multicast_group cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeerUDP_leave_multicast_group
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PacketPeerUDP "leave_multicast_group"
           '[GodotString, GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.PacketPeerUDP.leave_multicast_group

{-# NOINLINE bindPacketPeerUDP_listen #-}

bindPacketPeerUDP_listen :: MethodBind
bindPacketPeerUDP_listen
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "listen" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

listen ::
         (PacketPeerUDP :< cls, Object :< cls) =>
         cls -> Int -> Maybe GodotString -> Maybe Int -> IO Int
listen cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, defaultedVariant VariantString "*" arg2,
       maybe (VariantInt (65536)) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeerUDP_listen (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PacketPeerUDP "listen"
           '[Int, Maybe GodotString, Maybe Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.PacketPeerUDP.listen

{-# NOINLINE bindPacketPeerUDP_set_broadcast_enabled #-}

-- | Enable or disable sending of broadcast packets (e.g. @set_dest_address("255.255.255.255", 4343)@. This option is disabled by default.
--   				Note: Some Android devices might require the @CHANGE_WIFI_MULTICAST_STATE@ permission and this option to be enabled to receive broadcast packets too.
bindPacketPeerUDP_set_broadcast_enabled :: MethodBind
bindPacketPeerUDP_set_broadcast_enabled
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "set_broadcast_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enable or disable sending of broadcast packets (e.g. @set_dest_address("255.255.255.255", 4343)@. This option is disabled by default.
--   				Note: Some Android devices might require the @CHANGE_WIFI_MULTICAST_STATE@ permission and this option to be enabled to receive broadcast packets too.
set_broadcast_enabled ::
                        (PacketPeerUDP :< cls, Object :< cls) => cls -> Bool -> IO ()
set_broadcast_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeerUDP_set_broadcast_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PacketPeerUDP "set_broadcast_enabled" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PacketPeerUDP.set_broadcast_enabled

{-# NOINLINE bindPacketPeerUDP_set_dest_address #-}

-- | Sets the destination address and port for sending packets and variables. A hostname will be resolved using DNS if needed.
--   				Note: @method set_broadcast_enabled@ must be enabled before sending packets to a broadcast address (e.g. @255.255.255.255@).
bindPacketPeerUDP_set_dest_address :: MethodBind
bindPacketPeerUDP_set_dest_address
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "set_dest_address" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the destination address and port for sending packets and variables. A hostname will be resolved using DNS if needed.
--   				Note: @method set_broadcast_enabled@ must be enabled before sending packets to a broadcast address (e.g. @255.255.255.255@).
set_dest_address ::
                   (PacketPeerUDP :< cls, Object :< cls) =>
                   cls -> GodotString -> Int -> IO Int
set_dest_address cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeerUDP_set_dest_address
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PacketPeerUDP "set_dest_address"
           '[GodotString, Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.PacketPeerUDP.set_dest_address

{-# NOINLINE bindPacketPeerUDP_wait #-}

-- | Waits for a packet to arrive on the bound address. See @method bind@.
--   				__Note:__ @method wait@ can't be interrupted once it has been called. This can be worked around by allowing the other party to send a specific "death pill" packet like this:
--   		@codeblocks@
--   		@gdscript@
--   		socket = PacketPeerUDP.new()
--   		# Server
--   		socket.set_dest_address("127.0.0.1", 789)
--   		socket.put_packet("Time to stop".to_ascii())
--   
--   		# Client
--   		while socket.wait() == OK:
--   		    var data = socket.get_packet().get_string_from_ascii()
--   		    if data == "Time to stop":
--   		        return
--   		@/gdscript@
--   		@csharp@
--   		var socket = new PacketPeerUDP();
--   		// Server
--   		socket.SetDestAddress("127.0.0.1", 789);
--   		socket.PutPacket("Time to stop".ToAscii());
--   
--   		// Client
--   		while (socket.Wait() == OK)
--   		{
--   		    string data = socket.GetPacket().GetStringFromASCII();
--   		    if (data == "Time to stop")
--   		    {
--   		        return;
--   		    }
--   		}
--   		@/csharp@
--   		@/codeblocks@
bindPacketPeerUDP_wait :: MethodBind
bindPacketPeerUDP_wait
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "wait" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Waits for a packet to arrive on the bound address. See @method bind@.
--   				__Note:__ @method wait@ can't be interrupted once it has been called. This can be worked around by allowing the other party to send a specific "death pill" packet like this:
--   		@codeblocks@
--   		@gdscript@
--   		socket = PacketPeerUDP.new()
--   		# Server
--   		socket.set_dest_address("127.0.0.1", 789)
--   		socket.put_packet("Time to stop".to_ascii())
--   
--   		# Client
--   		while socket.wait() == OK:
--   		    var data = socket.get_packet().get_string_from_ascii()
--   		    if data == "Time to stop":
--   		        return
--   		@/gdscript@
--   		@csharp@
--   		var socket = new PacketPeerUDP();
--   		// Server
--   		socket.SetDestAddress("127.0.0.1", 789);
--   		socket.PutPacket("Time to stop".ToAscii());
--   
--   		// Client
--   		while (socket.Wait() == OK)
--   		{
--   		    string data = socket.GetPacket().GetStringFromASCII();
--   		    if (data == "Time to stop")
--   		    {
--   		        return;
--   		    }
--   		}
--   		@/csharp@
--   		@/codeblocks@
wait :: (PacketPeerUDP :< cls, Object :< cls) => cls -> IO Int
wait cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeerUDP_wait (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PacketPeerUDP "wait" '[] (IO Int) where
        nodeMethod = Godot.Core.PacketPeerUDP.wait