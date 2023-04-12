local _status_ok, leap = pcall(require, "leap")
if not _status_ok then
    return
end

leap.add_default_mappings()
