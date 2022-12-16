local ok, _ = pcall(require, "impatient")

if not ok then
    vim.notify_once("impatient not installed")
    return {}
end

_G.__luacache_config = {
    chunks = {
        enable = true,
        path = vim.fn.stdpath('cache') .. '/luacache_chunks',
    },
    modpaths = {
        enable = true,
        path = vim.fn.stdpath('cache') .. '/luacache_modpaths',
    }
}

vim.g.impatient_enable_at_startup = 1

return {}
