; Auto-generated. Do not edit!


(cl:in-package lslidar_c16_msgs-msg)


;//! \htmlinclude LslidarC16Layer.msg.html

(cl:defclass <LslidarC16Layer> (roslisp-msg-protocol:ros-message)
  ((scan_channel
    :reader scan_channel
    :initarg :scan_channel
    :type (cl:vector sensor_msgs-msg:LaserScan)
   :initform (cl:make-array 16 :element-type 'sensor_msgs-msg:LaserScan :initial-element (cl:make-instance 'sensor_msgs-msg:LaserScan))))
)

(cl:defclass LslidarC16Layer (<LslidarC16Layer>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LslidarC16Layer>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LslidarC16Layer)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lslidar_c16_msgs-msg:<LslidarC16Layer> is deprecated: use lslidar_c16_msgs-msg:LslidarC16Layer instead.")))

(cl:ensure-generic-function 'scan_channel-val :lambda-list '(m))
(cl:defmethod scan_channel-val ((m <LslidarC16Layer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lslidar_c16_msgs-msg:scan_channel-val is deprecated.  Use lslidar_c16_msgs-msg:scan_channel instead.")
  (scan_channel m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LslidarC16Layer>) ostream)
  "Serializes a message object of type '<LslidarC16Layer>"
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'scan_channel))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LslidarC16Layer>) istream)
  "Deserializes a message object of type '<LslidarC16Layer>"
  (cl:setf (cl:slot-value msg 'scan_channel) (cl:make-array 16))
  (cl:let ((vals (cl:slot-value msg 'scan_channel)))
    (cl:dotimes (i 16)
    (cl:setf (cl:aref vals i) (cl:make-instance 'sensor_msgs-msg:LaserScan))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LslidarC16Layer>)))
  "Returns string type for a message object of type '<LslidarC16Layer>"
  "lslidar_c16_msgs/LslidarC16Layer")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LslidarC16Layer)))
  "Returns string type for a message object of type 'LslidarC16Layer"
  "lslidar_c16_msgs/LslidarC16Layer")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LslidarC16Layer>)))
  "Returns md5sum for a message object of type '<LslidarC16Layer>"
  "68a91988942756cb30282e7a5cad7fbd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LslidarC16Layer)))
  "Returns md5sum for a message object of type 'LslidarC16Layer"
  "68a91988942756cb30282e7a5cad7fbd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LslidarC16Layer>)))
  "Returns full string definition for message of type '<LslidarC16Layer>"
  (cl:format cl:nil "# Header header~%# The 0th scan is at the bottom~%sensor_msgs/LaserScan[16] scan_channel~%================================================================================~%MSG: sensor_msgs/LaserScan~%# Single scan from a planar laser range-finder~%#~%# If you have another ranging device with different behavior (e.g. a sonar~%# array), please find or create a different message, since applications~%# will make fairly laser-specific assumptions about this data~%~%Header header            # timestamp in the header is the acquisition time of ~%                         # the first ray in the scan.~%                         #~%                         # in frame frame_id, angles are measured around ~%                         # the positive Z axis (counterclockwise, if Z is up)~%                         # with zero angle being forward along the x axis~%                         ~%float32 angle_min        # start angle of the scan [rad]~%float32 angle_max        # end angle of the scan [rad]~%float32 angle_increment  # angular distance between measurements [rad]~%~%float32 time_increment   # time between measurements [seconds] - if your scanner~%                         # is moving, this will be used in interpolating position~%                         # of 3d points~%float32 scan_time        # time between scans [seconds]~%~%float32 range_min        # minimum range value [m]~%float32 range_max        # maximum range value [m]~%~%float32[] ranges         # range data [m] (Note: values < range_min or > range_max should be discarded)~%float32[] intensities    # intensity data [device-specific units].  If your~%                         # device does not provide intensities, please leave~%                         # the array empty.~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LslidarC16Layer)))
  "Returns full string definition for message of type 'LslidarC16Layer"
  (cl:format cl:nil "# Header header~%# The 0th scan is at the bottom~%sensor_msgs/LaserScan[16] scan_channel~%================================================================================~%MSG: sensor_msgs/LaserScan~%# Single scan from a planar laser range-finder~%#~%# If you have another ranging device with different behavior (e.g. a sonar~%# array), please find or create a different message, since applications~%# will make fairly laser-specific assumptions about this data~%~%Header header            # timestamp in the header is the acquisition time of ~%                         # the first ray in the scan.~%                         #~%                         # in frame frame_id, angles are measured around ~%                         # the positive Z axis (counterclockwise, if Z is up)~%                         # with zero angle being forward along the x axis~%                         ~%float32 angle_min        # start angle of the scan [rad]~%float32 angle_max        # end angle of the scan [rad]~%float32 angle_increment  # angular distance between measurements [rad]~%~%float32 time_increment   # time between measurements [seconds] - if your scanner~%                         # is moving, this will be used in interpolating position~%                         # of 3d points~%float32 scan_time        # time between scans [seconds]~%~%float32 range_min        # minimum range value [m]~%float32 range_max        # maximum range value [m]~%~%float32[] ranges         # range data [m] (Note: values < range_min or > range_max should be discarded)~%float32[] intensities    # intensity data [device-specific units].  If your~%                         # device does not provide intensities, please leave~%                         # the array empty.~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LslidarC16Layer>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'scan_channel) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LslidarC16Layer>))
  "Converts a ROS message object to a list"
  (cl:list 'LslidarC16Layer
    (cl:cons ':scan_channel (scan_channel msg))
))
