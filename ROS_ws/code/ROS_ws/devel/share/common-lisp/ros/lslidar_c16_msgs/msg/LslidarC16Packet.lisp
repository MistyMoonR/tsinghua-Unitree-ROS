; Auto-generated. Do not edit!


(cl:in-package lslidar_c16_msgs-msg)


;//! \htmlinclude LslidarC16Packet.msg.html

(cl:defclass <LslidarC16Packet> (roslisp-msg-protocol:ros-message)
  ((stamp
    :reader stamp
    :initarg :stamp
    :type cl:real
    :initform 0)
   (data
    :reader data
    :initarg :data
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 1206 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass LslidarC16Packet (<LslidarC16Packet>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LslidarC16Packet>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LslidarC16Packet)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lslidar_c16_msgs-msg:<LslidarC16Packet> is deprecated: use lslidar_c16_msgs-msg:LslidarC16Packet instead.")))

(cl:ensure-generic-function 'stamp-val :lambda-list '(m))
(cl:defmethod stamp-val ((m <LslidarC16Packet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lslidar_c16_msgs-msg:stamp-val is deprecated.  Use lslidar_c16_msgs-msg:stamp instead.")
  (stamp m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <LslidarC16Packet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lslidar_c16_msgs-msg:data-val is deprecated.  Use lslidar_c16_msgs-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LslidarC16Packet>) ostream)
  "Serializes a message object of type '<LslidarC16Packet>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'stamp)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'stamp) (cl:floor (cl:slot-value msg 'stamp)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LslidarC16Packet>) istream)
  "Deserializes a message object of type '<LslidarC16Packet>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'stamp) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array 1206))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i 1206)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LslidarC16Packet>)))
  "Returns string type for a message object of type '<LslidarC16Packet>"
  "lslidar_c16_msgs/LslidarC16Packet")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LslidarC16Packet)))
  "Returns string type for a message object of type 'LslidarC16Packet"
  "lslidar_c16_msgs/LslidarC16Packet")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LslidarC16Packet>)))
  "Returns md5sum for a message object of type '<LslidarC16Packet>"
  "ae4f90a23256f44e82baa08dd45c3456")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LslidarC16Packet)))
  "Returns md5sum for a message object of type 'LslidarC16Packet"
  "ae4f90a23256f44e82baa08dd45c3456")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LslidarC16Packet>)))
  "Returns full string definition for message of type '<LslidarC16Packet>"
  (cl:format cl:nil "# Raw Leishen LIDAR packet.~%~%time stamp              # packet timestamp~%uint8[1206] data        # packet contents~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LslidarC16Packet)))
  "Returns full string definition for message of type 'LslidarC16Packet"
  (cl:format cl:nil "# Raw Leishen LIDAR packet.~%~%time stamp              # packet timestamp~%uint8[1206] data        # packet contents~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LslidarC16Packet>))
  (cl:+ 0
     8
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LslidarC16Packet>))
  "Converts a ROS message object to a list"
  (cl:list 'LslidarC16Packet
    (cl:cons ':stamp (stamp msg))
    (cl:cons ':data (data msg))
))
