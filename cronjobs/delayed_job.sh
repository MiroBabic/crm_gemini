#!/bin/bash
#source $HOME/.profile
export PATH=$HOME/.rbenv/bin:$PATH
export PATH=$HOME/.rbenv/shims:$PATH

cd /home/miro/crm_gemini && RAILS_ENV=production bin/delayed_job restart