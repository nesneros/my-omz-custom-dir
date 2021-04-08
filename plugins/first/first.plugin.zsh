# Spefify where gcloud is installed. This is used by ohmyzsh gcloud plugin
# The logic below is heavy inspired by the glcoud plugin

# Set CLOUDSDK_HOME
if [[ -z "${CLOUDSDK_HOME}" ]]; then
  search_locations=(
      $HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk
  )

  for gcloud_sdk_location in $search_locations; do
    if [[ -d "${gcloud_sdk_location}" ]]; then
      CLOUDSDK_HOME="${gcloud_sdk_location}"
      break
    fi
  done
fi
