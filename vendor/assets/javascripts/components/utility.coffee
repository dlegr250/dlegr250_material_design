#======================================================================
# Utility functions
#======================================================================
class @Utility
  @bytesToHumanSize = (bytes) ->
    sizes = ["Bytes", "KB", "MB", "GB", "TB"]
    i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)))
    return Math.round(bytes / Math.pow(1024, i), 2) + " " + sizes[i]
