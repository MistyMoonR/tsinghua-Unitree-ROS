// Auto-generated. Do not edit!

// (in-package lslidar_c16_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let LslidarC16Point = require('./LslidarC16Point.js');

//-----------------------------------------------------------

class LslidarC16Scan {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.altitude = null;
      this.points = null;
    }
    else {
      if (initObj.hasOwnProperty('altitude')) {
        this.altitude = initObj.altitude
      }
      else {
        this.altitude = 0.0;
      }
      if (initObj.hasOwnProperty('points')) {
        this.points = initObj.points
      }
      else {
        this.points = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LslidarC16Scan
    // Serialize message field [altitude]
    bufferOffset = _serializer.float64(obj.altitude, buffer, bufferOffset);
    // Serialize message field [points]
    // Serialize the length for message field [points]
    bufferOffset = _serializer.uint32(obj.points.length, buffer, bufferOffset);
    obj.points.forEach((val) => {
      bufferOffset = LslidarC16Point.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LslidarC16Scan
    let len;
    let data = new LslidarC16Scan(null);
    // Deserialize message field [altitude]
    data.altitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [points]
    // Deserialize array length for message field [points]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.points = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.points[i] = LslidarC16Point.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 52 * object.points.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'lslidar_c16_msgs/LslidarC16Scan';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bcd29f667509c681a7820aacabe51d58';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Altitude of all the points within this scan
    float64 altitude
    
    # The valid points in this scan sorted by azimuth
    # from 0 to 359.99
    LslidarC16Point[] points
    
    ================================================================================
    MSG: lslidar_c16_msgs/LslidarC16Point
    # Time when the point is captured
    float32 time
    
    # Converted distance in the sensor frame
    float64 x
    float64 y
    float64 z
    
    # Raw measurement from Leishen C16
    float64 azimuth
    float64 distance
    float64 intensity
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LslidarC16Scan(null);
    if (msg.altitude !== undefined) {
      resolved.altitude = msg.altitude;
    }
    else {
      resolved.altitude = 0.0
    }

    if (msg.points !== undefined) {
      resolved.points = new Array(msg.points.length);
      for (let i = 0; i < resolved.points.length; ++i) {
        resolved.points[i] = LslidarC16Point.Resolve(msg.points[i]);
      }
    }
    else {
      resolved.points = []
    }

    return resolved;
    }
};

module.exports = LslidarC16Scan;
