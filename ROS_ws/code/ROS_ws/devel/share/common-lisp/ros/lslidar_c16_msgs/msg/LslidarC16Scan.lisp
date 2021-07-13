; Auto-generated. Do not edit!


(cl:in-package lslidar_c16_msgs-msg)


;//! \htmlinclude LslidarC16Scan.msg.html

(cl:defclass <LslidarC16Scan> (roslisp-msg-protocol:ros-message)
  ((altitude
    :reader altitude
    :initarg :altitude
    :type cl:float
    :initform 0.0)
   (points
    :reader points
    :initarg :points
    :type (cl:vector lslidar_c16_msgs-msg:LslidarC16Point)
   :initform (cl:make-array 0 :element-type 'lslidar_c16_msgs-msg:LslidarC16Point :initial-element (cl:make-instance 'lslidar_c16_msgs-msg:LslidarC16Point))))
)

(cl:defclass LslidarC16Scan (<LslidarC16Scan>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LslidarC16Scan>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LslidarC16Scan)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lslidar_c16_msgs-msg:<LslidarC16Scan> is deprecated: use lslidar_c16_msgs-msg:LslidarC16Scan instead.")))

(cl:ensure-generic-function 'altitude-val :lambda-list '(m))
(cl:defmethod altitude-val ((m <LslidarC16Scan>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lslidar_c16_msgs-msg:altitude-val is deprecated.  Use lslidar_c16_msgs-msg:altitude instead.")
  (altitude m))

(cl:ensure-generic-function 'points-val :lambda-list '(m))
(cl:defmethod points-val ((m <LslidarC16Scan>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lslidar_c16_msgs-msg:points-val is deprecated.  Use lslidar_c16_msgs-msg:points instead.")
  (points m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LslidarC16Scan>) ostream)
  "Serializes a message object of type '<LslidarC16Scan>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'altitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'points))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LslidarC16Scan>) istream)
  "Deserializes a message object of type '<LslidarC16Scan>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'altitude) (roslisp-utils:decode-double-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'lslidar_c16_msgs-msg:LslidarC16Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LslidarC16Scan>)))
  "Returns string type for a message object of type '<LslidarC16Scan>"
  "lslidar_c16_msgs/LslidarC16Scan")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LslidarC16Scan)))
  "Returns string type for a message object of type 'LslidarC16Scan"
  "lslidar_c16_msgs/LslidarC16Scan")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LslidarC16Scan>)))
  "Returns md5sum for a message object of type '<LslidarC16Scan>"
  "bcd29f667509c681a7820aacabe51d58")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LslidarC16Scan)))
  "Returns md5sum for a message object of type 'LslidarC16Scan"
  "bcd29f667509c681a7820aacabe51d58")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LslidarC16Scan>)))
  "Returns full string definition for message of type '<LslidarC16Scan>"
  (cl:format cl:nil "# Altitude of all the points within this scan~%float64 altitude~%~%# The valid points in this scan sorted by azimuth~%# from 0 to 359.99~%LslidarC16Point[] points~%~%================================================================================~%MSG: lslidar_c16_msgs/LslidarC16Point~%# Time when the point is captured~%float32 time~%~%# Converted distance in the sensor frame~%float64 x~%float64 y~%float64 z~%~%# Raw measurement from Leishen C16~%float64 azimuth~%float64 distance~%float64 intensity~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LslidarC16Scan)))
  "Returns full string definition for message of type 'LslidarC16Scan"
  (cl:format cl:nil "# Altitude of all the points within this scan~%float64 altitude~%~%# The valid points in this scan sorted by azimuth~%# from 0 to 359.99~%LslidarC16Point[] points~%~%================================================================================~%MSG: lslidar_c16_msgs/LslidarC16Point~%# Time when the point is captured~%float32 time~%~%# Converted distance in the sensor frame~%float64 x~%float64 y~%float64 z~%~%# Raw measurement from Leishen C16~%float64 azimuth~%float64 distance~%float64 intensity~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LslidarC16Scan>))
  (cl:+ 0
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LslidarC16Scan>))
  "Converts a ROS message object to a list"
  (cl:list 'LslidarC16Scan
    (cl:cons ':altitude (altitude msg))
    (cl:cons ':points (points msg))
))
