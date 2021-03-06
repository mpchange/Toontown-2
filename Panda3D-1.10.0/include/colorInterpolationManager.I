// Filename: colorInterpolationManager.I
// Created by:  joswilso (02Jun05)
//
////////////////////////////////////////////////////////////////////
//
// PANDA 3D SOFTWARE
// Copyright (c) Carnegie Mellon University.  All rights reserved.
//
// All use of this software is subject to the terms of the revised BSD
// license.  You should have received a copy of this license along
// with this source code in a file named "LICENSE."
//
////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////
//    Function : ColorInterpolationFunctionConstant::get_color_a
//      Access : public
// Description : Returns the primary color of the function.
////////////////////////////////////////////////////////////////////

INLINE LColor ColorInterpolationFunctionConstant::
get_color_a() const {
  return _c_a;
}

////////////////////////////////////////////////////////////////////
//    Function : ColorInterpolationFunctionConstant::set_color_a
//      Access : public
// Description : Sets the primary color of the function.
////////////////////////////////////////////////////////////////////

INLINE void ColorInterpolationFunctionConstant::
set_color_a(const LColor &c) {
  _c_a = c;
}

////////////////////////////////////////////////////////////////////
//    Function : ColorInterpolationFunctionLinear::get_color_b
//      Access : public
// Description : Returns the secondary color of the function.
////////////////////////////////////////////////////////////////////

INLINE LColor ColorInterpolationFunctionLinear::
get_color_b() const {
  return _c_b;
}

////////////////////////////////////////////////////////////////////
//    Function : ColorInterpolationFunctionLinear::set_color_b
//      Access : public
// Description : Sets the secondary color of the function.
////////////////////////////////////////////////////////////////////

INLINE void ColorInterpolationFunctionLinear::
set_color_b(const LColor &c) {
  _c_b = c;
}

////////////////////////////////////////////////////////////////////
//    Function : ColorInterpolationFunctionStepwave::get_width_a
//      Access : public
// Description : Returns the primary width of the function.
////////////////////////////////////////////////////////////////////

INLINE PN_stdfloat ColorInterpolationFunctionStepwave::
get_width_a() const {
  return _w_a;
}

////////////////////////////////////////////////////////////////////
//    Function : ColorInterpolationFunctionStepwave::get_width_b
//      Access : public
// Description : Returns the secondary width of the function.
////////////////////////////////////////////////////////////////////

INLINE PN_stdfloat ColorInterpolationFunctionStepwave::
get_width_b() const {
  return _w_b;
}

////////////////////////////////////////////////////////////////////
//    Function : ColorInterpolationFunctionStepwave::set_width_a
//      Access : public
// Description : Sets the primary width of the function.
////////////////////////////////////////////////////////////////////

INLINE void ColorInterpolationFunctionStepwave::
set_width_a(const PN_stdfloat w) {
  _w_a = w;
}

////////////////////////////////////////////////////////////////////
//    Function : ColorInterpolationFunctionStepwave::set_width_b
//      Access : public
// Description : Sets the secondary width of the function.
////////////////////////////////////////////////////////////////////

INLINE void ColorInterpolationFunctionStepwave::
set_width_b(const PN_stdfloat w) {
  _w_b = w;
}


////////////////////////////////////////////////////////////////////
//    Function : ColorInterpolationFunctionSinusoid::get_period
//      Access : public
// Description : Returns the time to transition from A to B then back
//               to A again.
////////////////////////////////////////////////////////////////////

INLINE PN_stdfloat ColorInterpolationFunctionSinusoid::
get_period() const {
  return _period;
}

////////////////////////////////////////////////////////////////////
//    Function : ColorInterpolationFunctionSinusoid::set_period
//      Access : public
// Description : Sets the time to transition from A to B then back
//               to A again.
////////////////////////////////////////////////////////////////////

INLINE void ColorInterpolationFunctionSinusoid::
set_period(const PN_stdfloat p) {
  _period = p;
}

////////////////////////////////////////////////////////////////////
//    Function : ColorInterpolationSegment::get_function
//      Access : public
// Description : Returns a reference to the function object 
//               corresponding to this segment.
////////////////////////////////////////////////////////////////////

INLINE TypedReferenceCount* ColorInterpolationSegment::
get_function() const {
  return _color_inter_func;
}

////////////////////////////////////////////////////////////////////
//    Function : ColorInterpolationSegment::get_time_begin
//      Access : public
// Description : Returns the point in the particle's lifetime at which
//               this segment begins its effect.  It is an interpolated
//               value in the range [0,1].
////////////////////////////////////////////////////////////////////

INLINE PN_stdfloat ColorInterpolationSegment::
get_time_begin() const {
  return _t_begin;
}

////////////////////////////////////////////////////////////////////
//    Function : ColorInterpolationSegment::get_time_end
//      Access : public
// Description : Returns the point in the particle's lifetime at which
//               this segment's effect stops.  It is an interpolated
//               value in the range [0,1].
////////////////////////////////////////////////////////////////////

INLINE PN_stdfloat ColorInterpolationSegment::
get_time_end() const {
  return _t_end;
}

////////////////////////////////////////////////////////////////////
//    Function : ColorInterpolationSegment::is_modulated
//      Access : public
// Description : Returns whether the function is additive or modulated.
////////////////////////////////////////////////////////////////////

INLINE bool ColorInterpolationSegment::
is_modulated() const {
  return _is_modulated;
}

////////////////////////////////////////////////////////////////////
//    Function : ColorInterpolationSegment::is_enabled()
//      Access : public
// Description : Returns whether the segments effects are being applied.
////////////////////////////////////////////////////////////////////

INLINE bool ColorInterpolationSegment::
is_enabled() const {
  return _enabled;
}

////////////////////////////////////////////////////////////////////
//    Function : ColorInterpolationSegment::get_id
//      Access : public
// Description : Returns the id assigned to this segment by the
//               manager that created it.
////////////////////////////////////////////////////////////////////

INLINE int ColorInterpolationSegment::
get_id() const {
  return _id;
}

////////////////////////////////////////////////////////////////////
//    Function : ColorInterpolationSegment::set_function
//      Access : public
// Description : Sets the function that the segment will use for 
//               its interpolation calculations.
////////////////////////////////////////////////////////////////////

INLINE void ColorInterpolationSegment::
set_function(ColorInterpolationFunction* function) {
  _color_inter_func = function;
}

////////////////////////////////////////////////////////////////////
//    Function : ColorInterpolationSegment::set_time_begin
//      Access : public
// Description : Sets the point in the particle's lifetime at which
//               this segment begins its effect.  It is an interpolated
//               value in the range [0,1].
////////////////////////////////////////////////////////////////////

INLINE void ColorInterpolationSegment::
set_time_begin(const PN_stdfloat time) {
  _t_begin = time;
  _t_total = _t_end-_t_begin;
}

////////////////////////////////////////////////////////////////////
//    Function : ColorInterpolationSegment::set_time_end
//      Access : public
// Description : Sets the point in the particle's lifetime at which
//               this segment's effect ends.  It is an interpolated
//               value in the range [0,1].
////////////////////////////////////////////////////////////////////

INLINE void ColorInterpolationSegment::
set_time_end(const PN_stdfloat time) {
  _t_end = time;
  _t_total = _t_end-_t_begin;
}

////////////////////////////////////////////////////////////////////
//    Function : ColorInterpolationSegment::set_is_modulated
//      Access : public
// Description : Sets how the function is applied to the final color.
//               If true, the value is multiplied. If false, the value
//               is simply added. Default is true.
////////////////////////////////////////////////////////////////////

INLINE void ColorInterpolationSegment::
set_is_modulated(const bool flag) {
  _is_modulated = flag;
}

////////////////////////////////////////////////////////////////////
//    Function : ColorInterpolationSegment::set_enabled()
//      Access : public
// Description : Sets whether the segments effects should be applied.
////////////////////////////////////////////////////////////////////

INLINE void ColorInterpolationSegment::
set_enabled(const bool enabled) {
  _enabled = enabled;
}

////////////////////////////////////////////////////////////////////
//    Function : ColorInterpolationManager::set_default_color
//      Access : public
// Description : Sets the color to used if no segments are present
////////////////////////////////////////////////////////////////////

INLINE void ColorInterpolationManager::
set_default_color(const LColor &c) {
  _default_color = c;
}

////////////////////////////////////////////////////////////////////
//    Function : ColorInterpolationManager::get_segment
//      Access : public
// Description : Returns the segment that corresponds to 'seg_id'.
////////////////////////////////////////////////////////////////////

INLINE ColorInterpolationSegment* ColorInterpolationManager::
get_segment(const int seg_id) {
  pvector<PT(ColorInterpolationSegment)>::iterator iter;

  for(iter = _i_segs.begin();iter != _i_segs.end();++iter)
    if( seg_id == (*iter)->get_id() )
      return (*iter);

  return NULL;
}

////////////////////////////////////////////////////////////////////
//    Function : ColorInterpolationManager::get_segment_id_list
//      Access : public
// Description : Returns a space delimited list of all of the ids
//               in the manager at the time.
////////////////////////////////////////////////////////////////////

INLINE string ColorInterpolationManager::
get_segment_id_list() {
  pvector<PT(ColorInterpolationSegment)>::iterator iter;
  ostringstream output;

  for(iter = _i_segs.begin();iter != _i_segs.end();++iter)
    output << (*iter)->get_id() << " ";

  string str = output.str();
  return str.substr(0, str.length()-1);
}
