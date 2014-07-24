% make.m - Builds mex functions.

%% Set paths to ZMQ
INCLUDE_PATH = '/usr/local/Cellar/zeromq/4.0.4/include/';
LIB_PATH = '/usr/local/Cellar/zeromq/4.0.4/lib/';
COMPILE_FLAGS = sprintf('-I%s -L%s', INCLUDE_PATH, LIB_PATH);

FILE_LIST = {'zmq_version.c', ...
             'zmq_ctx_new.c', ...
             'zmq_ctx_term.c', ...
             'zmq_ctx_shutdown.c', ...
             'zmq_ctx_get.c', ...
             'zmq_ctx_set.c', ...
             'zmq_socket.c'};
        

BUILD_FUNCTION = @(file) eval(['mex -v', COMPILE_FLAGS, sprintf(' %s ', char(file)), '-lzmq']);
cellfun(BUILD_FUNCTION, FILE_LIST);

