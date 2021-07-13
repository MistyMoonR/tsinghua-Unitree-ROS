// Auto-generated. Do not edit!

// (in-package lslidar_c16_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

class LslidarC16Layer {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.scan_channel = null;
    }
    else {
      if (initObj.hasOwnProperty('scan_channel')) {
        this.scan_channel = initObj.scan_channel
      }
      else {
        this.scan_channel = new Array(16).fill(new sensor_msgs.msg.LaserScan());
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LslidarC16Layer
    // Check that the constant length array field [scan_channel] has the right length
    if (obj.scan_channel.length !== 16) {
      throw new Error('Unable to serialize array field scan_channel - length must be 16')
    }
    // Serialize message field [scan_channel]
    obj.scan_channel.forEach((val) => {
      bufferOffset = sensor_msgs.msg.LaserScan.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LslidarC16Layer
    let len;
    let data = new LslidarC16Layer(null);
    // Deserialize message field [scan_channel]
    len = 16;
    data.scan_channel = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.scan_channel[i] = sensor_msgs.msg.LaserScan.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.scan_channel.forEach((val) => {
      length += sensor_msgs.msg.LaserScan.getMessageSize(val);
    });
    return length;
  }

  static datatype() {
    // Returns string type for a message object
    return 'lslidar_c16_msgs/LslidarC16Layer';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '68a91988942756cb30282e7a5cad7fbd';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Header header
    # The 0th scan is at the bottom
    sensor_msgs/LaserScan[16] scan_channel
    ================================================================================
    MSG: sensor_msgs/LaserScan
    # Single scan from a planar laser range-finder
    #
    # If you have another ranging device with different behavior (e.g. a sonar
    # array), please find or create a different message, since applications
    # will make fairly laser-specific assumptions about this data
    
    Header header            # timestamp in the header is the acquisition time of 
                             # the first ray in the scan.
                             #
                             # in frame frame_id, angles are measured around 
                             # the positive Z axis (counterclockwise, if Z is up)
                             # with zero angle being forward along the x axis
                             
    float32 angle_min        # start angle of the scan [rad]
    float32 angle_max        # end angle of the scan [rad]
    float32 angle_increment  # angular distance between measurements [rad]
    
    float32 time_increment   # time between measurements [seconds] - if your scanner
                             # is moving, this will be used in interpolating position
                             # of 3d points
    float32 scan_time        # time between scans [seconds]
    
    float32 range_min        # minimum range value [m]
    float32 range_max        # maximum range value [m]
    
    float32[] ranges         # range data [m] (Note: values < range_min or > range_max should be discarded)
    float32[] intensities    # intensity data [device-specific units].  If your
                             # device does not provide intensities, please leave
                             # the array empty.
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LslidarC16Layer(null);
    if (msg.scan_channel !== undefined) {
      resolved.scan_channel = new Array(16)
      for (let i = 0; i < resolved.scan_channel.length; ++i) {
        if (msg.scan_channel.length > i) {
          resolved.scan_channel[i] = sensor_msgs.msg.LaserScan.Resolve(msg.scan_channel[i]);
        }
        else {
          resolved.scan_channel[i] = new sensor_msgs.msg.LaserScan();
        }
      }
    }
    else {
      resolved.scan_channel = new Array(16).fill(new sensor_msgs.msg.LaserScan())
    }

    return resolved;
    }
};

module.exports = LslidarC16Layer;
