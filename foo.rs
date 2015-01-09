#![crate_type = "staticlib"]
use std::sync::{StaticMutex, MUTEX_INIT};
use std::rt;
use std::ptr;

static LOCK: StaticMutex = MUTEX_INIT;
static mut INIT: bool = false;

#[no_mangle]
pub extern fn init() {
    unsafe {
        // Obtain the lock
        let _guard = LOCK.lock();

        // If initialized, return
        if INIT { return; }

        // Initialize the rust runtime
        rt::args::init(0, ptr::null());

        INIT = true;
    }
}
