// I AM AUTO-GENERATED, DON'T CHECK ME INTO SUBVERSION (or else...)
package com.cubeia.firebase.io.protocol {

    import com.cubeia.firebase.io.PacketInputStream;
    import com.cubeia.firebase.io.PacketOutputStream;
    import com.cubeia.firebase.io.ProtocolObject;
  
    import flash.utils.ByteArray;

    public class TableUpdatePacket implements ProtocolObject {
        public static const CLASSID:int = 144;

        public function classId():int {
            return TableUpdatePacket.CLASSID;
        }

        public var tableid:int;
        public var seated:int;
        public var params:Array = new Array();
        public var removedParams:Array = new Array();

        public function save():ByteArray
        {
            var buffer:ByteArray = new ByteArray();
            var ps:PacketOutputStream = new PacketOutputStream(buffer);
            ps.saveInt(tableid);
            ps.saveShort(seated);
            ps.saveInt(params.length);
            var i:int;
            for( i = 0; i != params.length; i ++)
            {
                var _tmp_params:ByteArray? = params[i].save();
                ps.saveArray(_tmp_params);
            }
            ps.saveInt(removedParams.length);
            for( i = 0; i != removedParams.length; i ++)
            {
                ps.saveString(removedParams[i]);
            }
            return buffer;
        }

        public function load(buffer:ByteArray):void 
        {
            var ps:PacketInputStream = new PacketInputStream(buffer);
            tableid = ps.loadInt();
            seated = ps.loadShort();
            var i:int;
            var paramsCount:int = ps.loadInt();
            params = new Array();
            for( i = 0; i < paramsCount; i ++) {
                var _tmp1:Param  = new Param();
                _tmp1.load(buffer);
                params[i] = _tmp1;
            }
            var removedParamsCount:int = ps.loadInt();
            removedParams = new Array();
            for (i = 0; i < removedParamsCount; i ++)
            {
                removedParams[i] = ps.loadString();
            }
        }
        

        public function toString():String
        {
            var result:String = "TableUpdatePacket :";
            result += " tableid["+tableid+"]" ;
            result += " seated["+seated+"]" ;
            result += " params["+params+"]" ;
            result += " removed_params["+removedParams+"]" ;
            return result;
        }

    }
}

// I AM AUTO-GENERATED, DON'T CHECK ME INTO SUBVERSION (or else...)

