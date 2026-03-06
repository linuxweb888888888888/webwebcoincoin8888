# Use a specific, stable tag from the jupyter/docker-stacks images
# Do NOT use `:latest` or an empty tag for mybinder.org compatibility
FROM jupyter/scipy-notebook:2024-05-15

# Set up the user environment expected by BinderHub
# NB_UID must be 1000
ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

# Switch to root to perform installations and change permissions
USER root

# Install additional packages via pip or apt, if needed
# Example: RUN apt-get update && apt-get install -y <package-name>
# Example: RUN python3 -m pip install --no-cache-dir pandas scikit-learn

# Copy your repository contents into the home directory of the 'jovyan' user
COPY . ${HOME}

# Ensure the 'jovyan' user owns the files in their home directory
RUN chown -R ${NB_UID} ${HOME}

# Switch back to the non-root user (jovyan) to run the notebook server
USER ${NB_USER}

# The base image already has the ENTRYPOINT and CMD configured to run JupyterLab
# mybinder.org overrides the command line arguments to launch the server correctly.
