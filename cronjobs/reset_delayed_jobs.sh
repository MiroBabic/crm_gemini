#!/bin/bash
#source $HOME/.profile
export PATH=$HOME/.rbenv/bin:$PATH
export PATH=$HOME/.rbenv/shims:$PATH

cd /home/miro/crm_gemini && RAILS_ENV=production rake mass_update:delayed_job